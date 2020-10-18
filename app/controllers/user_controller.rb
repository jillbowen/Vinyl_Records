require './config/environment'

class UserController < ApplicationController
   
    get "/login" do
        erb :"user_views/user_login"
    end

    post "/login" do
        user = User.find_by_username(params[:username])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect #this will be the link to whatever a user's show_vinyl page will go to
        else
            #add error message here if time!
            redirect '/'
        end
    end

    get "/signup" do
        erb :"user_views/user_signup"
    end

end