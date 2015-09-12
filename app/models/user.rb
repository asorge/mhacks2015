class User < ActiveRecord::Base
	def proper_name
		"#{first_name} #{last_name}"
	end
end
