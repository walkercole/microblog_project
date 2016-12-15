require "sinatra"
require "sinatra/flash"
require "sinatra/activerecord"

set :database, {adapter: "sqlite3", database: "mydb.sqlite3"}
require "./models"

enable :sessions

def current_user
	if session[:user_id]
		User.find session[:user_id]
	end
end

get "/" do
	erb :index
end

post "/sign-up" do 
	@user = User.create(username: params["regname"], password: params["regpass"])
	flash[:notice] = "User Created! Please Login."
	redirect "/"
end

post "/login" do 
	@user = User.find_by username: params["username"]
	if @user && @user.password == params["password"]
		session[:user_id] = @user.id
		flash[:notice] = "Welcome Back!"
	else 
		flash[:error] = "Login Failed"
	end
	redirect "/"
end

get "/logout" do
	session[:user_id] = nil
	flash[:notice] = "Later &lt;/3"
	redirect "/"
end

get "/my_profile" do 
	@user = current_user
	erb :my_profile
end

post "/my_profile" do 
	@user = current_user
	@user.profile.full_name = params["profile_name"]
	@user.profile.location = params["profile_loc"]
	@user.profile.bio = params["profile_bio"]
	@user.profile.save
	erb :my_profile
end
get "/profile/:user_id" do
	@user = User.find params["user_id"]
	erb :profile
end