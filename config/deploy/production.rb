set :stage, :production

server 'rallytapp.com', user: 'deploy', roles: %w{web app}

fetch(:default_env).merge!(rails_env: :production)
