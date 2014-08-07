namespace :backup do
  desc 'sets up backups (install gems)'
  task :setup do
    on :primary do
      backup_dir = "#{fetch(:current_path)}/#{fetch(:backup_path, 'backup')}"
      execute "cd #{backup_dir} && bundle install"
     end
  end

  desc 'triggers the backup job'
  task :trigger do
    on :primary do
      backup_dir = "#{fetch(:current_path)}/#{fetch(:backup_path, 'backup')}"
      execute "cd #{backup_dir} && bundle exec backup perform --trigger #{fetch(:backup_job, 'rails_database')} --config-file ./config.rb"
     end
  end
end
