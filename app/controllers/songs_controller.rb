class SongsController < ApplicationController
  def index
    @songs = Song.order(:queue_position).where(recording_id: nil)
  end
end
