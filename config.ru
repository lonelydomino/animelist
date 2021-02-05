ENV['SINATRA_ENV'] ||= 'development' #set enviroment variable
require './config/environment'


use Rack::MethodOverride#allows put patch and delete requests

# use UserController
# use AnimeController
# use SessionsController
run ApplicationController #can only use run one time, entry point of app
