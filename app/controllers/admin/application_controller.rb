class Admin::ApplicationController < ActionController::Base
	layout 'admin_application'
	protect_from_forgery with: :exception
	before_action :check_admin_login, :except => [:login, :login_auth]
	before_action :check_session, :only => [:login]

	private
		def check_admin_login
			unless session[:user_id].blank?
				@user = User.find(session[:user_id])
			else
				redirect_to '/admin/login'
			end
		end

		def check_session
			unless session[:user_id].blank?
				redirect_to '/admin'
			end
		end
end
