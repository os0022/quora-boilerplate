require_relative './config/init.rb'
require "uri"
set :run, true
enable :sessions

##############################
# GET ROUTES
##############################

get '/' do
  @all_questions = Question.all
  erb :home
end

get '/sign_up' do
  erb :sign_up
end

get '/login' do
  erb :login
end

get '/logout' do
	session[:id] = nil
	session[:username] = nil
	redirect '/login'
end

get "/users/:id" do
	# => params[:id]
	if session[:username] != nil && session[:id] != nil
		# @user = session[:username]
		@user = User.find(params[:id])
		erb :show
	else
		redirect '/login'
	end
end

get "/questions/new" do
	erb :question_new
end

get "/questions/:id" do
	@question = Question.find(params[:id].to_i)
    erb :questions
end

# get "/questions" do
	
# 	erb :allquestions
# end

##############################
# POST ROUTES
##############################

post '/sign_up' do
	z = User.where(email: params[:user][:email])
	if z.length == 1
		@taken_email = []
		@taken_email << "email is already taken"
		erb :sign_up
	else
		if params[:user][:password].length < 8
			@pass = []
			@pass << "Must be more that 8 digits"
			erb :sign_up
		else
			x = User.new(
				first_name: params[:user][:first_name],
				last_name: params[:user][:last_name],
				username: params[:user][:username],
				email: params[:user][:email],
				password: params[:user][:password],
				password_confirmation: params[:user][:password])
			x.save
		
			if x.errors.any?

				@errors = x.errors
				erb :sign_up

			else
				redirect '/'
			end
		end
	end
end

post '/login' do 
	user = User.find_by(username: params[:user][:username]).try(:authenticate, params[:user][:password])
	if user 
		session[:id] = user.id
		session[:username] = user.username
		redirect "/users/#{user.id}"
	else
		@incorrect_email = []
		@incorrect_email << "username or password is incorrect"
		erb :login
	end
end

post "/questions/new" do
	# Create question into the database
	@question = Question.new(title: params[:question][:title], content: params[:question][:content], user_id: session[:id])
	@question.save
	redirect "/questions/#{@question.id}"
end

post "/questions/:id" do
	@question = Question.find(params[:id].to_i)
	@answer = Answer.new(content: params[:answer], user_id: session[:id], question_id: params[:id])
	@answer.save
	redirect "/questions/#{@question.id}"
end

post "/answers/:id/vote" do
	vote = Vote.find_by(answer_id: params[:id].to_i, user_id: session[:id])
	if vote
		flash[:notice] = "You have already voted."
		redirect back
		
	else
		Vote.create(user_id: session[:id], answer_id: params[:id], upvote: 1)
		redirect back
	end

end

##############################
# PUT ROUTES
##############################

##############################
# DELETE ROUTES
##############################






