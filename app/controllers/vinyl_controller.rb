require './config/environment'

class VinylController < ApplicationController
    
    get "/vinyl" do
        if logged_in?
            @vinyls = current_user.vinyl
            @vinyls = @vinyls.sort_by {|v| [v.artist_name, v.album_name]}
            erb :"vinyl_views/index_vinyl"
        else
            redirect "/login"
        end
    end
    
    get "/vinyl/new" do
        redirect_user
            @vinyl = current_user.vinyl
            erb :"/vinyl_views/create_vinyl"
    end

    post "/vinyl" do
        @vinyl = current_user.vinyl.build(album_name: params[:album_name], artist_name: params[:artist_name], vinyl_condition: params[:vinyl_condition])
        if @vinyl.save
            redirect "/vinyl/#{@vinyl.id}"
        else 
            redirect "/vinyl/new"
        end
    end

    get "/vinyl/:id" do
        redirect_user
            if @vinyl = current_user.vinyl.find_by(id: params[:id])
                erb :"vinyl_views/show_vinyl"
            else
                redirect '/'
            end
        end
    end

    get "/vinyl/:id/edit" do
        @vinyl = current_user.vinyl.find_by(id: params[:id])
            if @vinyl
                erb :"vinyl_views/edit_vinyl"
            else
                redirect "/vinyl"
            end
    end

    patch "/vinyl/:id" do
        @vinyl = current_user.vinyl.find_by(id: params[:id])
        @vinyl.album_name = params[:album_name]
        @vinyl.artist_name = params[:artist_name]
        @vinyl.vinyl_condition = params[:vinyl_condition]
        @vinyl.save
        redirect "/vinyl/#{@vinyl.id}"
    end

    delete "/vinyl/:id" do
        if @vinyl = current_user.vinyl.find_by(id: params[:id])
            @vinyl.destroy
        end
        redirect "/vinyl"
    end
end