class Song < ApplicationRecord
  belongs_to :recording, required: false
  validates :title, uniqueness: {scope: :artist}

  def put_in_back_of_queue
    self.queue_position = Song.maximum(:queue_position).to_i + 1
  end

  def at_top_of_queue?
    queue_position == 1
  end
end
