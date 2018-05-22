# frozen_string_literal: true

require 'csv'

desc 'Convenience wrapper for resetting the database'
task reset: ['db:reset', 'import:conftool']

def latest_csv
  # get the last updated CSV file from lib/assets
  Dir.glob('./lib/assets/*.csv').max_by { |f| File.mtime(f) }
end

namespace :db do
  namespace :heroku do
    desc 'Create a heroku database backup'
    task backup: :environment do
      puts 'Creating a snapshot of the database on heroku'
      `heroku pg:backups capture`
    end

    desc 'Download a heroku database backup'
    task download: :environment do
      puts 'Downloading the latest database snapshot'
      # system("curl -o voting-#{Time.now.strftime('%Y-%m-%d_%H-%M-%S')}.dump #{url}")
      puts "Run the following command: \nheroku pg:backups:download"
      puts "\n See https://devcenter.heroku.com/articles/heroku-postgres-backups#restoring-backups for restoring database"
    end

    desc 'Download and restore the production database locally'
    task local_restore: :environment do
      `rm latest.dump*`
      `heroku pg:backups capture`
      `heroku pg:backups:download`
      `pg_restore --verbose --clean --no-acl --no-owner -h localhost -d voting_development latest.dump`
    end
  end
end

namespace :report do
  desc 'Generate report for voting; see https://gist.github.com/waynegraham/664a8d627168d51cea71836c6a20a060 for special sauce'
  task generate: :environment do
    # ActiveRecord::Base.establish_connection('development')
    ActiveRecord::Base.connection.execute("COPY (SELECT title, cached_votes_total, contribution_type FROM proposals ORDER BY contribution_type, cached_votes_total DESC) TO '#{Rails.root.join('report.csv')}' WITH CSV DELIMITER ',';")
  end
end

namespace :import do
  desc 'Import CSV documents from ConfTool dump'
  task conftool: :environment do
    # contribution_type_ignore = ['LAC Preconference']
    contribution_type_ignore = ['']

    contribution_order = [
      'Learn@DLF',
      '2018 DLF Forum',
      'Digital Preservation 2018'
    ]

    CSV.foreach(latest_csv, headers: true, encoding: 'UTF-8') do |row|
      puts "Adding #{row['title']}"
      unless contribution_type_ignore.include? row['contribution_type']
        Proposal.find_or_create_by!(id: row['paperID']) do |proposal|
          proposal.author              = row['authors'],
                                         proposal.title               = row['title'],
                                         proposal.abstract            = row['abstract'],
                                         proposal.contribution_type   = row['contribution_type']
          proposal.contribution_format = row['contribution_format']

          proposal.order = contribution_order.index(row['contribution_type'])
        end
      end
    end
  end
end

namespace :reset do
  desc 'Clean out the proposals, leave the people'
  task proposals: [:environment, 'db:heroku:backup', 'db:heroku:download'] do
    Proposal.destroy_all
  end
end
