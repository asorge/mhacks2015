class Application < ActiveRecord::Base
	# Document uploader for resume and cover letter
	mount_uploader :resume, ResumeUploader
	mount_uploader :cover_letter, CoverLetterUploader

	# Validations
	validates_presence_of :date_submitted, :status
	validates_date :date_submitted

	# Relationships
	belongs_to :user
	belongs_to :job_listing

	# Scopes
	scope :by_status, -> { order(:status) }
	scope :by_date, -> { order(date_submitted: :desc) }
end