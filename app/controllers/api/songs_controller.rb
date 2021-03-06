class Api::SongsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create

       @artist = Artist.find(params[:artist_id])

       @new_song = @artist.songs.new(song_params)


       if @new_song.save
         render status: 201, json: {
           message: "song successfully created",
           song: @new_song
         }.to_json
       else
         render status: 422, json: {
           errors: @new_song.errors
         }.to_json
       end

  end

  def destroy

    if params[:id] != 'delete_all'

      song = Song.find(params[:id])
      song.destroy

      render status: 200, json: {
        message: "song successfully deleted"
      }.to_json
    else
      @artist = Artist.find(params[:artist_id])
      @artist.songs.destroy_all

      render status: 200, json: {
        message: "all songs form artist successfully deleted"
      }.to_json
    end

  end
  def song_params
    params
      .require(:song)
      .permit(
        :title
      )
  end
end
