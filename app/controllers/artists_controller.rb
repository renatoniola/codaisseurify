class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :destroy]

  def index

    @artists = Artist.all

  end

  def show

    @songs = @artist.songs

  end

  def new
    @artist_item = Artist.new
    @photos = @artist.photos
  end

  def create

    #@artists = Artist.all

    @artist_item = Artist.new( artist_params )

    if @artist_item.save

      image_params.each do |image|
        @artist_item.photos.create(image: image)
      end
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

  def image_params
    params[:images].present? ? params.require(:images) : []
  end

  def set_artist
    @artist= Artist.find(params[:id])
  end

  def artist_params
   params
     .require(:artist)
     .permit(
       :name
     )
 end

end
