class Admin::ReservationController < Admin::ApplicationController
	def index
		@booking = Booking.all

		unless params[:booking_status_id].blank?
			@booking = @booking.where(booking_status_id: params[:booking_status_id])
		end

		unless params[:from].blank? && params[:to].blank?
			@booking = @booking.where('bookings.created_at::date between ? and ?', params[:from], params[:to])
		end

		unless params[:name].blank?
			@booking = @booking.joins(:client).where('first_name iLike :name or last_name iLike :name', { name: "%#{params[:name]}%" })
		end

		@booking = @booking.paginate(:per_page => 20,:page => params[:page])
	end
end
