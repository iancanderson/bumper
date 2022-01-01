class AddQueuePositionToSongs < ActiveRecord::Migration[7.0]
  def change
    add_column :songs, :queue_position, :integer, null: false
  end
end
