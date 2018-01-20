class SongsController < ApplicationController

  def create

    @artist = Artist.find(params[:artist_id])


    @new_song = @artist.songs.new( song_params )

    if @new_song.save
      redirect_to artist_path(params[:artist_id]), notice: "song successfully created"
    else
      redirect_to artist_path(params[:artist_id]), notice: "there was a problem saving the song"
    end
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
