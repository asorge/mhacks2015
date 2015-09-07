class UserInterest < ActiveRecord::Base
	# Relationships
	belongs_to :user 
	belongs_to :company

	# Validations
	validates_presence_of :rating
	validates_numericality_of :ratinig, greater_than: 0
end
