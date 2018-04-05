class Client < ApplicationRecord
	before_save :encrypt
	def encrypt
		self.sid = Digest::MD5.hexdigest(created_at.to_s)
	end
end
