class BookingController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
	end

	def search
		roomId = params[:room_id].blank? ? "1=1" : "room_id = #{params[:room_id]}"
		
		bookId = []
		book = Booking.select('room_id, count(room_id)').joins(:room).where("((:from > checked_in and :from < checked_out) or (:to > checked_in and :to < checked_out)) and #{roomId}",{ from: params[:from], to: params[:to] }).group(:room_id, :room_number).having("count(room_id) = room_number")
		book.each do |b|
			bookId << b.room_id
		end

		roomId = params[:room_id].blank? ? "1=1" : "id = #{params[:room_id]}"
		@room = Room.where(roomId)

		unless bookId.blank?
			@room = @room.where("id not in (?)", bookId)
		end
	end

	def new
		@room = Room.find(params[:room_id])
	end

	def create
		respond_to do |format|
			params[:client_status_id] = 1
			@client = Client.new(client_params)
			if @client.save
				params[:client_id] = @client.id
				params[:booking_status_id] = 1
				@booking = Booking.new(booking_params)
				if @booking.save
					format.html { redirect_to '/booking/thank-you', notice: "Successfully sent request." }
				else
					format.html { redirect_to '/booking/thank-you', danger: "There was and error sending your request." }
				end
			else
				format.html { redirect_to '/booking/thank-you', danger: "There was and error sending your request." }
			end
		end
	end

	def thank_you
	end

	private
		def client_params
			params.permit(:first_name, :middle_name, :last_name, :email_address, :contact_number, :address, :client_status_id)
		end

		def booking_params
			params.permit(:checked_in, :checked_out, :client_id, :guest, :total_amount, :booking_status_id, :room_id)
		end
end
