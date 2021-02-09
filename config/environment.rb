ENV['SINATRA_ENV'] ||= 'development'

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])
require 'dotenv/load'


set :database, {adapter: "sqlite3", database: "db/development.db"}
ActiveRecord::Base.logger = Logger.new(STDOUT)

require_all 'app'