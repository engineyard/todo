require "bundler/capistrano"
require "capistrano-rbenv"

set :rbenv_ruby_version, "2.1.2"

server "192.168.33.10", :web, :app, :db, primary: true

set :application, "todo"
set :user, "deploy"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:engineyard/#{application}.git"
set :branch, "eycap"

set :default_run_options, {:pty => true}
# set :ssh_options, {:forward_agent => true, keys: ['/Volumes/threeterrabyte/vagrant/home/insecure_private_key']}
set :ssh_options, {:forward_agent => true}

after "deploy", "deploy:cleanup" # keep only the last 5 releases