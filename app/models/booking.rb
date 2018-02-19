class Booking < ApplicationRecord
  belongs_to :client
  belongs_to :booking_status
end
