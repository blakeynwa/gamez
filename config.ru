# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)
require "pathname"

set :app_file, __FILE__

path_to_root_directory = File.expand_path('../', __FILE__)
APP_ROOT = Pathname.new(path_to_root_directory)


run Sinatra::Application
