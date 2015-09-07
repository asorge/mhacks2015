class UserInterest < ActiveRecord::Base
	# Relationships
	belongs_to :user 
	belongs_to :company

	# Validations
	validates_presence_of :rating
	validates_numericality_of :rating, greater_than: 0

	# Scopes
	scope :by_company, -> { joins(:company).order('companies.name') }
	scope :by_rating, -> { order(:rating) }
end
