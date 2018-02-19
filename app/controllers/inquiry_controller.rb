class InquiryController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
	end

	def create
		respond_to do |format|

			@client = Client.new(client_params)
			if @client.save
				params[:client_id] = @client.id
				@inquiry = Inquiry.new(inquiry_params)
				if @inquiry.save
					format.html { redirect_to '/inquiry', notice: "Successfully sent request." }
				else
					format.html { redirect_to '/inquiry', danger: "There was and error sending your request." }
				end
			else
				format.html { redirect_to '/inquiry', danger: "There was and error sending your request." }
			end

		
			
		end
	end

	private
		def client_params
			params.permit(:first_name, :middle_name, :last_name, :email_address, :contact_number, :address)
		end

		def inquiry_params
			params.permit(:client_id, :event_date, :event_id, :message)
		end
end
