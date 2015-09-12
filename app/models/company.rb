class Company < ActiveRecord::Base
	# Relationships
	has_many :user_interests
	has_many :job_listings

	# Validations
	validates_presence_of :name, :url, :description, :location
	
	# Scopes
	scope :alphabetical,  -> { order(:name) }
end
