class JobListing < ActiveRecord::Base
	# Relationships
	belongs_to :company

	# Validations
	validates_presence_of :title, :description, :location, :url, :date_posted, :contact
	validates_date :date_posted
end
