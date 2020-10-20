require './config/environment'
#I think a lot of this is maybe not correct! Start checking and going through errors
class VinylController < ApplicationController
    
    get "/vinyl_views/show_vinyl" do
        if logged_in?
            @vinyls = current_user.vinyl
            @vinyls = @vinyls.sort_by {|vinyl| vinyl.artist_name}
        # @vinyls = Vinyl.all
        # @vinyl = Vinyl.create(album_name: params[:album_name], artist_name: params[:artist_name], vinyl_condition: params[:vinyl_condition], total_vinyl: params[:total-vinyl])
         erb :"vinyl_views/index_vinyl"
        else
            redirect "/login"
        end
    end

    get "/vinyl_views/:vinyl_id" do
        if logged_in?
            if @vinyl = current_user.vinyl.find_by(id: params[:id])
                erb :"/vinyl_views/show_vinyl"
            else
                redirect '/'
            end
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

end