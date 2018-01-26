class SongsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create

    @artist = Artist.find(params[:artist_id])

    @new_song = @artist.songs.new(song_params)

    respond_to do |format|
        if @new_song.save
           format.json { render :show, status: :created, location: @artist }
           format.html { redirect_to artist_path(params[:artist_id]), notice: 'song successfully created' }
        else
           format.html { redirect_to artist_path(params[:artist_id]), notice: 'there was a problem saving the song' }
           format.json { render json: @artist.errors, status: :unprocessable_entity }
        end
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
