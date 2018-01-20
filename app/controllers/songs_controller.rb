class SongsController < ApplicationController

  def create

    @artist = Artist.find(params[:artist_id])
    @artist.songs.create( song_params )

    redirect_to artist_path(params[:artist_id])
  end

  def destroy
    @song = Song.find(params[:id])

    @song.destroy

    redirect_to artist_path(params[:artist_id])
  end

  private

  def song_params
   params
     .require(:song)
     .permit(
       :title
     )
 end
end
