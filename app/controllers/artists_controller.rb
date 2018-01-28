class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :destroy]

   IMAGE_NOT_FOUND = 'http://res.cloudinary.com/renatos/image/upload/v1517140901/imagenotfound_bytgea.jpg'

  def index

    @image_not_found = IMAGE_NOT_FOUND
    
    case params['order_by']
    when 'name_asc'
      @order_by_name = 'name_desc'
      @order_by_date = 'date_asc'
      @artists = Artist.order_by_name_asc
      @order_text_by_name = 'order names desc'
      @order_text_by_date = 'order dates desc'
    when 'name_desc'
      @order_by_name = 'name_asc'
      @order_by_date = 'date_asc'
      @artists = Artist.order_by_name_desc
      @order_text_by_name = 'order names asc'
      @order_text_by_date = 'order dates desc'
    when 'date_asc'
      @order_by_date = 'date_desc'
      @order_by_name = 'name_asc'
      @artists = Artist.order_by_date_asc
      @order_text_by_date = 'order dates desc'
      @order_text_by_name = 'order names asc'
    when 'date_desc'
      @order_by_date = 'date_asc'
      @order_by_name = 'name_asc'
      @artists = Artist.order_by_date_desc
      @order_text_by_date = 'order dates asc'
      @order_text_by_name = 'order names asc'
    else
      @order_by_name = 'name_desc'
      @order_by_date = 'date_asc'
      @order_text_by_name = 'order names desc'
      @order_text_by_date = 'order dates asc'
      @artists = Artist.order_by_name_asc
    end


  end

  def show
    @image_not_found = IMAGE_NOT_FOUND
    @songs = @artist.songs
    @photos = @artist.photos
  end

  def new
    @artist_item = Artist.new

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
