class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :destroy]

  def index
    @artists = Artist.all
  end

  def show

    @songs = @artist.songs
    
  end

  def destroy
    @artist.destroy
    redirect_to artists_path
  end
  private

  def set_artist
    @artist= Artist.find(params[:id])
  end

end
