class Application < ActiveRecord::Base
	# Document uploader for resume amd cover letter
	mount_uploader :document, DocumentUploader

	# Validations
	validates_presence_of :date_submitted, :status, :contact
	validates_date :date_submitted

	# Relationships
	belongs_to :user
	belongs_to :job_listing
end
