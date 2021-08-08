require './config/environment'

class UserController < ApplicationController
   
    get "/signup" do
        if logged_in?
            redirect "/vinyl" 
        else
            @user = User.create
            erb :"user_views/user_signup"
        end
    end

    post "/signup" do
        @user = User.create(username: params[:username], email: params[:email], password: params[:password], favorite_bands: params[:favorite_bands])
    
        if @user.save
          session[:user_id] = @user.id
          redirect "/vinyl"
        else
          erb :"user_views/user_signup"
        end
      end
    
    get "/login" do
        erb :"user_views/user_login"
    end

    post "/login" do
        @user = User.find_by(username: params[:username])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect "/vinyl" 
        else
            redirect '/'
        end
    end

    get "/logout" do
        if logged_in?
            session.clear
            redirect "/login"
        else
            redirect "/login"
        end
    end

end