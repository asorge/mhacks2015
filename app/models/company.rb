class Company < ActiveRecord::Base
	# Relationships
	has_many :user_interests
	has_many :job_listings
end
