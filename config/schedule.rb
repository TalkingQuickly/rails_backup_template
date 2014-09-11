# Store output in standard logging directory
set :output, "#{path}/log/cron_log.log"

# Make sure $PATH for cron jobs is the same as our
# regular environemtn
env :PATH, ENV['PATH']

# Make sure the rails environment is set
env :RAILS_ENV, ENV['RAILS_ENV']

# Trigger our backup job every hour
every 60.minutes, roles: [:primary]  do
  command "cd #{path}/backup && RAILS_ENV=#{RAILS_ENV} bundle exec backup perform -t rails_database --config_file ./config.rb"
end
