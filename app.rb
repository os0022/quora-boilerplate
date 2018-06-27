require_relative './config/init.rb'
set :run, true

get '/' do
  erb :"home"
end

get '/date' do
  # get all students from database
  @time = Time.now

  # render index.erb from students directory
  erb :"date"
end