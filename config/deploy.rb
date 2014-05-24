set :application, 'meetup'
set :repo_url, 'git@github.com:sled/web-ex-4.git'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
set :deploy_to, -> { "/u/apps/#{fetch(:application)}" }
set :scm, :git


# set :format, :pretty
# set :log_level, :debug
# set :pty, true

set :linked_files, %w{config/initializers/secret_token.rb}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/uploads private}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :keep_releases, 5

# Use rake with .env, i.e. use `bundle exec foreman run rake`, aphew...
SSHKit.config.command_map[:rake] = "./bin/rake"

namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'provision:upstart:puma-restart'
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'
end