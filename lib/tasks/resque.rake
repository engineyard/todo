require 'resque/tasks'
require 'resque/scheduler/tasks'

namespace :resque do
  task :setup => :environment
  task :setup_schedule => :setup do
    require 'resque-scheduler'
    Resque.schedule = YAML.load_file(File.join(Rails.root, 'config/schedule.yml'))
  end
  task :scheduler => :setup_schedule
end
