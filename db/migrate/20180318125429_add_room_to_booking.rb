class AddRoomToBooking < ActiveRecord::Migration[5.1]
  def change
    add_reference :bookings, :room, foreign_key: true
  end
end
