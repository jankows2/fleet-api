set :application, 'fleet-api'
set :stages, %w(production development)
set :default_stage, 'development'

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute "mkdir #{current_path}/tmp"
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  desc 'reload the database with seed data'
  task :seed do
    run "cd #{current_path}; bundle exec rake db:seed_fu"
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do

    end
  end

  after :finishing, 'deploy:cleanup'
end
