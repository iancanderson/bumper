class Song < ApplicationRecord
  belongs_to :recording, required: false

  def put_in_back_of_queue
    self.queue_position = Song.maximum(:queue_position).to_i + 1
  end
end
