class Application < ActiveRecord::Base
	# Document uploader for resume amd cover letter
	mount_uploader :document, DocumentUploader

	# Relationships
	belongs_to :user
	belongs_to :job_listing
end
