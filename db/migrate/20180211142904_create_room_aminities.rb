class CreateRoomAminities < ActiveRecord::Migration[5.1]
  def change
    create_table :room_aminities do |t|
      t.references :room, foreign_key: true
      t.references :aminity, foreign_key: true

      t.timestamps
    end
  end
end
