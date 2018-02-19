class UserMailer < ApplicationMailer
	def send_inquiry
		mail(to: "mj_caabay@yahoo.com", subject: "Test inquiry")
	end
end
