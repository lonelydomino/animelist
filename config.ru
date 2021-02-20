ENV['SINATRA_ENV'] ||= 'development'
require './config/environment'


use Rack::MethodOverride

if ActiveRecord::Base.connection.migration_context.needs_migration?
    raise 'Migrations are pending!'
end

use UserController
use ListsController
use AnimeController
use SessionsController
use SearchController
use ProfileController
run ApplicationController 
