class RoomController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
	end

	def show
		@room = Room.find_by(url: params['url'])
	end
end
