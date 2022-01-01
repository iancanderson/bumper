class SongsController < ApplicationController
  def index
    @songs = Song.order(:queue_position)
  end
end
