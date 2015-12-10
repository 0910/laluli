server '40.76.56.133', roles: [:web, :app, :db], primary: true

set :application,     'laluli'
set :user,            'ubuntu'
set :deploy_to,       "/home/ubuntu/applications/#{fetch(:application)}"
set :deploy_via,      :remote_cache
set :use_sudo,        false

set :scm, :git
set :repo_url,        'git@github.com:0910/laluli.git'
set :branch, :master
set :format, :pretty
set :log_level, :debug
set :keep_releases, 5

set :rbenv_ruby, '2.2.3'

set :stage,           :production
set :rails_env,       :production


default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :assets_roles, [:web, :app]            # Defaults to [:web]
# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'shared/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')


after "deploy", "deploy:cleanup" # keep only the last 5 releases

namespace :deploy do

  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "/etc/init.d/unicorn_#{application} #{command}"
    end
  end

  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}."
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts "WARNING: HEAD is not the same as origin/master"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end
  before "deploy", "deploy:check_revision"

end