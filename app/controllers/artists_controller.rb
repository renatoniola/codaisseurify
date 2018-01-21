class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :destroy]

  def index

    @artists = Artist.all

  end

  def show

    @songs = @artist.songs

  end

  def create

    @artists = Artist.all

    @new_artist = @artists.new( artist_params )

    if @new_artist.save

      redirect_to artists_path,  notice: "artist successfully created"
    else
      redirect_to artists_path , notice: "there was a problem saving the artist"
    end

  end

  def destroy
    @artist.destroy
    redirect_to artists_path
  end

  private

  def set_artist
    @artist= Artist.find(params[:id])
  end

  def artist_params
   params
     .permit(
       :name
     )
 end

end
