class UserInterest < ActiveRecord::Base
	# Relationships
	belongs_to :user 
	belongs_to :company
end
