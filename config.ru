ENV['SINATRA_ENV'] ||= 'development' #set enviroment variable
require './config/environment'


use Rack::MethodOverride#allows put patch and delete requests

if ActiveRecord::Base.connection.migration_context.needs_migration?
    raise 'Migrations are pending!'
end

use UserController
use ListsController
use AnimeController
use SessionsController
use SearchController
use ProfileController
run ApplicationController #can only use run one time, entry point of app
