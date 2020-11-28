class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def show
        #byebug
        @song = Song.find(params[:id])
        @genre = @song.genre
        @artist = @song.artist
    end

    def new
        #byebug
        @song = Song.new
    end

    def edit
        @song = Song.find(params[:id])
    end

    def create
        #byebug
        @song = Song.new(song_params(:name, :artist_id, :genre_id))
        @song.save
        redirect_to song_path(@song)
    end

    def update
        # byebug
        @song = Song.find(params[:id])
        @song.update(song_params(:name, :artist_id, :genre_id))
        @song.save
        redirect_to song_path(@song)
    end

    private

    def song_params(*args)
        params.require(:song).permit(*args)
    end

end
