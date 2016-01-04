ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

$: << '.'

Dir["app/models/*.rb"].each {|f| require f}
Dir["app/controllers/*.rb"].each {|f| require f}
Dir["app/views/*.rb"].each {|f| require f}
Dir["app/config/*.rb"].each {|f| require f}
Dir["app/db/*.rb"].each {|f| require f}
