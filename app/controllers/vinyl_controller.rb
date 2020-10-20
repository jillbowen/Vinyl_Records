require './config/environment'

class VinylController < ApplicationController
    
    get "/vinyl_views/index_vinyl" do
        @vinyls = Vinyl.all
        @vinyl = Vinyl.create(album_name: params[:album_name], artist_name: params[:artist_name], vinyl_condition: params[:vinyl_condition], total_vinyl: params[:total-vinyl])
        erb :"vinyl_views/index_vinyl"
    end
end