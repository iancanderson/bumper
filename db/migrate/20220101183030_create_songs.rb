class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|
      t.references :recording, foreign_key: true
      t.string :artist, null: false
      t.string :title, null: false

      t.timestamps
    end
  end
end
