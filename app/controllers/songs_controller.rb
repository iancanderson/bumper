class SongsController < ApplicationController
  def index
    @songs = Song.order(:queue_position).where(recording_id: nil)
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    @song.put_in_back_of_queue
    if @song.save
      redirect_to new_song_path, notice: "Song added to queue!"
    else
      redirect_to new_song_path, alert: "Error adding #{@song.title} by #{@song.artist}"
    end
  end

  private

  def song_params
    params[:song].permit(:artist, :title)
  end
end
