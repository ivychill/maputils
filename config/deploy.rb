require 'rvm/capistrano'
require 'bundler/capistrano'

set :application, "maputils"
set :repository,  "git@github.com:ivychill/#{application}.git"

set :scm, :git
set :user, "caiqingfeng"
set :deploy_to, "/home/caiqingfeng/webapps/#{application}"
set :keep_release, 5
set :rvm_type, :system
set :use_sudo, false

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "luyun-server.com"                          # Your HTTP server, Apache/etc
role :app, "luyun-server.com"                          # This may be the same as your `Web` server
role :db,  "luyun-server.com", :primary => true # This is where Rails migrations will run
role :db,  "luyun-server.com"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
