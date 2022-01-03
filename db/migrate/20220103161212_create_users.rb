class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
