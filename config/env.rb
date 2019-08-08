ENV['SINATRA_ENV'] ||= 'development'

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

configure :development do
  set :database, 'sqlite3:db/database.db'
end

# if ENV['SINATRA_ENV'] == 'development'
#   require_relative '../secret.rb'
# end
require_relative '../constant.rb'

require_all 'app'