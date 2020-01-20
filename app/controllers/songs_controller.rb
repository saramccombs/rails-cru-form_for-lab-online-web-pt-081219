class SongsController < ApplicationController

    def index 
        @songs = Song.all
    end

    def new
        @artists = Artist.all
        @genres = Genre.all
        @song = Song.new
    end

    def create 
        @song = Song.new(song_params)
        @song.save
        redirect_to song_url(@song)
    end

    def update 
        song_find_by_id
        @song.update(song_params)
        redirect_to song_url(@song)
    end

    def edit 
        song_find_by_id
    end

    def show 
        song_find_by_id
    end

    private

    def song_params
        params.require(:song).permit(:name, :artist_id, :genre_id)
    end

    def song_find_by_id
        @song = Song.find(params[:id])
    end
end
