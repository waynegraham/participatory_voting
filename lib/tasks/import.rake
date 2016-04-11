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
    CSV.foreach(latest_csv, headers: true) do |row|
      Proposal.find_or_create_by!(
        id: row['paperID'],
        author: row['authors'],
        title: row['title'],
        abstract: row['abstract']
      )
    end

  end
end
