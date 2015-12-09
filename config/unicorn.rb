# set path to application
app_root = "/var/www/applications/laluli"
current_path = "/var/www/applications/laluli/current"
shared_dir = "/var/www/applications/laluli/shared"
working_directory current_path


# Set unicorn options
worker_processes 2
preload_app true
timeout 30

# Set up socket location
listen "/tmp/unicorn.laluli.sock"

# Set unicorn config
unicorn_config "#{shared_path}/config/unicorn.rb"

# Logging
stderr_path "#{shared_dir}/log/unicorn.stderr.log"
stdout_path "#{shared_dir}/log/unicorn.stdout.log"

# Set master PID location
pid "#{current_path}/tmp/pids/unicorn.pid"

before_exec do |server| 
  ENV["BUNDLE_GEMFILE"] = "#{current_path}/Gemfile" 
end 

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  ActiveRecord::Base.establish_connection
  ActiveRecord::Base.verify_active_connections!
end
