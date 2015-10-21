require "pry"
require "sinatra"
require "sinatra/reloader"

enable(:sessions)

require_relative('models/login.rb')
require_relative('models/loginvalidity.rb')

get "/" do
	session[:loggedin] ||= false
	@errorslog = []
	erb(:index)
end

current_session = Checker.new
post "/login" do 
	#p params[:login]
	if params[:login] != nil
		 if current_session.login(params[:username], params[:password])
		 	session[:loggedin] = true
		 	session[:user] = params[:username]
		 	redirect ("/logged")
		 else
		 	redirect ("/")
		 end
	else
		@errorslog = PasswordChecker.new.check_password(params[:username], params[:password])
		if @errorslog == []
			current_session.add_users(params[:username], params[:password])
			@errorslog = ["Account Created"]
		end
		erb(:index)
	end
end

get "/logged" do
	#binding.pry
	if session[:loggedin] == true
		@message = "Welcome #{session[:user]}"
		erb (:logged)
	else
		redirect("/")
	end
end

post "/logout" do
	session.clear
	redirect ("/")
end
