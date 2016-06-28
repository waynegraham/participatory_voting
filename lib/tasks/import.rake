require 'csv'

desc "Convenience wrapper for resetting the database"
task :reset => ['db:reset', 'import:conftool']

def latest_csv
  # get the last updated CSV file from lib/assets
  Dir.glob('./lib/assets/*.csv').max_by {|f| File.mtime(f)}
end

namespace :db do
  namespace :heroku do
    desc "Create a heroku database backup"
    task :backup => :environment do
      puts "Creating a snapshot of the database on heroku"
      `heroku pg:backups capture`
    end

    desc "Download a heroku database backup"
    task :download => :environment do
      puts "Downloading the latest database snapshot"
      system("curl -o voting-#{Time.now.strftime('%Y-%m-%d_%H-%M-%S')}.dump `heroku pg:backups public-url`")
      puts "\n See https://devcenter.heroku.com/articles/heroku-postgres-backups#restoring-backups for restoring database"
    end
  end
end

namespace :report do
  desc "Generate report for voting; see https://gist.github.com/waynegraham/664a8d627168d51cea71836c6a20a060 for special sauce"
  task :generate => :environment do
    ActiveRecord::Base.establish_connection('development')
    ActiveRecord::Base.connection.execute("COPY (SELECT title, cached_votes_total, contribution_type FROM proposals ORDER BY contribution_type, cached_votes_total DESC) TO '#{Rails.root.join('report.csv')}' WITH CSV DELIMITER ',';")
  end
end

namespace :import do
  desc "Import CSV documents from ConfTool dump"
  task :conftool => :environment do
    CSV.foreach(latest_csv, headers: true, encoding: 'UTF-8') do |row|
      puts "Adding #{row['title']}"
      Proposal.find_or_create_by(id: row['paperID']) do |proposal|
        proposal.author              = row['authors'],
        proposal.title               = row['title'],
        proposal.abstract            = row['abstract'],
        proposal.contribution_type   = row['contribution_type']
        proposal.contribution_format = row['contribution_format']
      end
    end
  end


end

namespace :reset do
  desc "Clean out the proposals, leave the people"
  task :proposals => [:environment, "db:heroku:backup", "db:heroku:download" ] do
    Proposal.destroy_all
  end
end
