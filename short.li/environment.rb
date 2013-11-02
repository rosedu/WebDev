require 'bundler/setup'
Bundler.require :default, ENV['RACK_ENV'].to_s

env = ENV['RACK_ENV'] || "development"

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database =>  "db/#{env}.db"
)

# Autoload models
Dir.glob("models/*").each { |f| require File.expand_path("../#{f}", __FILE__)}

require File.expand_path("../short", __FILE__)