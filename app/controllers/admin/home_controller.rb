class Admin::HomeController < Admin::ApplicationController
	skip_before_action :verify_authenticity_token

	def index
	end

	def login
		respond_to do |format|
			format.html { render layout: false }
		end
	end

	def login_auth
		alert = 'Invalid authentication!'
		user = User.validate_login(params[:email_address],params[:password])

		unless user.blank?
			session[:user_id] = user.id
			redirect_to '/admin'
		else
			flash[:status] = false
			flash[:message] = alert
			redirect_back fallback_location: '/admin/login'
		end
	end

	def logout
		session[:user_id] = nil
		redirect_to '/admin/login'
	end
end
