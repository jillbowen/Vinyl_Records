require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, "app/public"
    set :views, "app/views" 
    enable :sessions
    set :session_secret, "the_vinyl_records_record"
  end

  helpers do
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!current_user
    end
  end

  get "/" do
    erb :index, :layout => :layout
  end
end
