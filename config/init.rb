# Specify gemfile Location and general variables

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

puts ENV['BUNDLE_GEMFILE']

require 'rubygems'

require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])

require 'pathname'

require 'pg'

require 'active_record'

require 'sinatra'

require 'byebug'

require 'bcrypt'

require 'sinatra/cookies'

require 'sinatra/flash'

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

set :public_folder, File.join(APP_ROOT, "public")

set :views, File.join(APP_ROOT, "views")
set :erb, layout: :'application'

require APP_ROOT.join('config', 'database')

# Setup controllers
# Dir[APP_ROOT.join('controllers', '*.rb')].each { |file| require file }
# Setup helper
Dir[APP_ROOT.join('helpers', '*.rb')].each { |file| require file }
