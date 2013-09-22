require 'bundler/capistrano'

set :application, "my_app"
set :repository,  "git://github.com/YOUR_USER/YOUR_APP.git"

set :scm, :git
set :user, 'www-data'
set :group, 'www-data'
set :deploy_to, '/var/www/my_app'
set :use_sudo, false
set :instance, "ec2-x-x-x-x.compute-1.amazonaws.com"

role :web, instance                          # Your HTTP server, Apache/etc
role :app, instance                          # This may be the same as your `Web` server
role :db,  instance, :primary => true # This is where Rails migrations will run
role :db,  instance

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

namespace :my_app do
  task :symlinks, :except => { :no_release => true } do
    run "#{try_sudo} ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "#{try_sudo} ln -nfs #{shared_path}/config/memcached.yml #{release_path}/config/memcached.yml"
    run "#{try_sudo} ln -nfs #{shared_path}/config/redis.yml #{release_path}/config/redis.yml"
  end
end
after 'deploy:symlink', 'my_app:symlinks'
