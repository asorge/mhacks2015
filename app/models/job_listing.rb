class JobListing < ActiveRecord::Base
	# Relationships
	belongs_to :company
	has_many :applications

	accepts_nested_attributes_for :applications, reject_if: lambda { |application| application[:status].blank? }, allow_destroy: true

	# Validations
	validates_presence_of :title, :description, :location, :url, :date_posted, :contact, :company_id
	validates_date :date_posted
end
