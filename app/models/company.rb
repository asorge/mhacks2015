class Company < ActiveRecord::Base
	# Relationships
	has_many :user_interests
	has_many :job_listings

	accepts_nested_attributes_for :user_interests, reject_if: lambda { |interest| interest[:rating].blank? }, allow_destroy: true

	# Validations
	validates_presence_of :name, :url, :description, :location
	
	# Scopes
	scope :alphabetical,  -> { order(:name) }
end