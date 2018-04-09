class User < ApplicationRecord
	belongs_to :user_role

	def self.validate_login(email, password)
		user = User.where('email_address = :email or username = :email', { email: email }).first

		if user.present? && user.password == Digest::MD5.hexdigest(password)
			user
		else
			nil
		end
	end
end
