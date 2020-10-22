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
        if logged_in?
            @vinyl = current_user.vinyl
            erb :"/vinyl_views/create_vinyl"
        else
            redirect "/login"
        end
    end

    post "/vinyl" do
        @vinyl = Vinyl.create(album_name: params[:album_name], artist_name: params[:artist_name], vinyl_condition: params[:vinyl_condition], user: current_user)
        redirect "/vinyl/#{@vinyl.id}"
    end

    get "/vinyl/:id" do
        @vinyl = Vinyl.find_by_id(params[:id])
        if logged_in?
            if @vinyl = current_user.vinyl.find_by(id: params[:id])
                erb :"vinyl_views/show_vinyl"
            else
                redirect '/'
            end
        else
            redirect "/login"
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
        Vinyl.destroy(params[:id])
        redirect "/vinyl"
    end
end