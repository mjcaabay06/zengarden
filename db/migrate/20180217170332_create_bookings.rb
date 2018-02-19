class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.date :checked_in
      t.date :checked_out
      t.references :client, foreign_key: true
      t.integer :guest
      t.float :total_amount
      t.references :booking_status, foreign_key: true

      t.timestamps
    end
  end
end
