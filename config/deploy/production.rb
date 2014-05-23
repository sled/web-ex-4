set :stage, :production
set :rails_env, 'production'


# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a has can be used to set
# extended properties on the server.
server '46.38.241.134', user: 'deploy', roles: %w{web app db}

# Server related configuration
set :domain, "v220110692595758.yourvserver.net"
set :server_name, -> { "#{fetch(:application)}.#{fetch(:domain)}" }
set :user, "deploy"



# Override tmp_dir because another rails app is deployed here as well and only
# one user actually has read access to the git-ssh.sh script...
set :tmp_dir, '/tmp/meetup'
before :'deploy:check', :make_tmpdir do
  on roles :all do
    execute :mkdir, fetch(:tmp_dir) unless test "[ -d #{fetch(:tmp_dir)} ]"
  end
end
