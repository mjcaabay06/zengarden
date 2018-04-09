class Admin::InquiryController < Admin::ApplicationController

	def index
		@inquiry = Inquiry.all

		unless params[:status].blank?
			@inquiry = @inquiry.where(status_id: params[:status])
		end

		unless params[:from].blank? && params[:to].blank?
			@inquiry = @inquiry.where('inquiries.created_at::date between ? and ?', params[:from], params[:to])
		end

		unless params[:name].blank?
			@inquiry = @inquiry.joins(:client).where('first_name iLike :name or last_name iLike :name', { name: "%#{params[:name]}%" })
		end

		@inquiry = @inquiry.paginate(:per_page => 20,:page => params[:page])
	end

	def show
		@inquiry = Inquiry.find(params[:id])
		@client = @inquiry.client

		if @inquiry.status_id == 1
			@inquiry.status_id = 2
			@inquiry.save
		end
	end
end
