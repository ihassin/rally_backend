set :stage, :development

my_ip = "stage.rallyserver.com"
my_user = "deploy"
my_server = "#{my_user}@#{my_ip}"

role :app, my_server
role :web, my_server
role :db,  my_server

server "#{my_ip}", user: "#{my_user}", roles: %w{web app}, my_property: :my_value

fetch(:default_env).merge!(rails_env: :development)
