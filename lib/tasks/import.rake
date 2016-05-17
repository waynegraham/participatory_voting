require 'csv'

desc "Convenience wrapper for resetting the database"
task :reset => ['db:reset', 'import:conftool']

def latest_csv
  # get the last updated CSV file from lib/assets
  Dir.glob('./lib/assets/*.csv').max_by {|f| File.mtime(f)}
end

namespace :import do
  desc "Import CSV documents from ConfTool dump"
  task :conftool => :environment do
    # NOTE: There is a bad header in the downloaded file;
    # workaround is just to open it in Excel and remove the bad
    # characters in the first column around "paperID"
    CSV.foreach(latest_csv, headers: true, encoding: 'UTF-8') do |row|
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
