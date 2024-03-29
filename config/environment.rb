require 'rubygems'
require 'bundler/setup'

require 'active_support/all'

# Load Sinatra Framework (with AR)
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/contrib/all' # Requires cookies, among other things

require 'sinatra/flash'
 
require 'pry' if development?

require 'carrierwave'
require 'carrierwave/orm/activerecord'
require 'mini_magick'

require_relative '../uploader/uploader'

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

# Sinatra configuration
configure do
  set :root, APP_ROOT.to_path
  set :server, :puma
  # Part of rack-flash and sinatra flash feature
  # use Rack::Flash
  enable :sessions
  set :session_secret, ENV['SESSION_KEY'] || 'lighthouselabssecret'

  set :views, File.join(Sinatra::Application.root, "app", "views")
end

# Set timezones

Time.zone = "Pacific Time (US & Canada)"

# Set up the database and models
require APP_ROOT.join('config', 'database')

# Load the routes / actions
require APP_ROOT.join('app', 'actions')

CarrierWave.configure do |config|
  config.root = APP_ROOT + 'public/'
end


