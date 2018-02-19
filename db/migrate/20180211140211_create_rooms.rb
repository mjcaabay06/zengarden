class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.float :rate
      t.integer :room_number
      t.integer :accomodates

      t.timestamps
    end
  end
end
