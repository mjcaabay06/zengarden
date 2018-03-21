class Booking < ApplicationRecord
  belongs_to :client
  belongs_to :room
  belongs_to :booking_status
end
