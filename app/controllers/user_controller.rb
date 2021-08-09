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
        @user = User.create(
            username: params[:username], 
            email: params[:email], 
            password: params[:password], 
            user_id: params[:user_id], 
            favorite_band_1: params[:favorite_band_1], 
            favorite_band_2: params[:favorite_band_2],
            favorite_band_3: params[:favorite_band_3])
    
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

    get "/user/:username/edit" do
        @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
            if @current_user
                erb :"user_views/edit_user"
            else
                redirect "/vinyl"
            end
    end

    patch "/user/:username" do
        @current_user = User.find_by(username: params[:username])
        @current_user.username = params[:username]
        @current_user.password = params[:password]
        @current_user.favorite_band_1 = params[:favorite_band_1]
        @current_user.favorite_band_2 = params[:favorite_band_2]
        @current_user.favorite_band_3 = params[:favorite_band_3]
        @current_user.save
        redirect "/vinyl"
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