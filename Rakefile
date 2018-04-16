# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,

require File.expand_path('config/application', __dir__)

Rails.application.load_tasks

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
rescue LoadError
  task :rubocop do
    raise 'Unable to load rubocop'
  end
end
