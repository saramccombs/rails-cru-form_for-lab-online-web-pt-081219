class ArtistsController < ApplicationController

    def index 
        @artists = Artist.all
    end

    def new 
        @artist = Artist.new
    end
    
    def create 
        @artist = Artist.new(artist_params)
        @artist.save
        redirect_to artist_url(@artist)
    end

    def edit
        artist_find_by_id
    end

    def update
        artist_find_by_id
        @artist.update(artist_params)
        redirect_to artist_url(@artist)
    end

    def show 
        artist_find_by_id
    end

    private

    def artist_params
        params.require(:artist).permit(:name, :bio)
    end

    def artist_find_by_id
        @artist = Artist.find(params[:id])
    end
end
