set :application, 'rallyserver'
set :repo_url, "git@github.com:ihassin/rally_backend.git"
set :use_sudo, true

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
set :branch, "master"

set :deploy_to, "/home/deploy/rallyserver"
set :scm, :git
set :git_shallow_clone, 1

set :format, :pretty
set :log_level, :debug
set :pty, true

set :user, 'deploy'

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :keep_releases, 3

namespace :deploy do

  desc 'Stop application'
  task :stop do
    on roles(:app), in: :sequence do
      execute "sudo kill `cat #{current_path}/tmp/pids/unicorn.pid`"
      execute "RAILS_ENV=#{fetch(:default_env)[:rails_env]} #{current_path}/bin/delayed_job stop"
    end
  end

  desc 'Start application'
  task :start do
    on roles(:app), in: :sequence do
      execute "cd #{current_path} && bundle exec unicorn -c #{current_path}/config/unicorn.rb -E #{fetch(:default_env)[:rails_env]} -D"
      execute "sudo service nginx reload"
      execute "cd #{current_path} && bundle exec rails g delayed_job -s -q && RAILS_ENV=#{fetch(:default_env)[:rails_env]} #{current_path}/bin/delayed_job start"
    end
  end

  desc "Restart web-server"
  task :restart do
    Rake::Task['deploy:stop'].execute rescue nil
    Rake::Task['deploy:start'].execute
  end

  desc "This will execute after publishing. It ensures delayed_job is installed and starts it"
  task :ensure_delayed_job_active do
    on roles(:app), in: :sequence do
      execute "cd #{current_path} && bundle exec rails g delayed_job -s -q && RAILS_ENV=#{fetch(:default_env)[:rails_env]} #{current_path}/bin/delayed_job start"
    end
  end

  task :before_test do
    puts "before_test"
  end

  task :test do
    puts "test"
  end

  task :after_test do
    puts "after_test"
  end

  after :test, :after_test
  before :test, :before_test

  after :published, :ensure_delayed_job_active
  after :finished, :restart
end
