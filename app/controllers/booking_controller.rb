class BookingController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
	end

	def search
		roomId = params[:room_id].blank? ? '1=1' : "id = #{params[:room_id]}"
		@room = Room.where(roomId)
	end

	def new
	end

	def create
	end
end
