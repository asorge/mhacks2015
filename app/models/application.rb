class Application < ActiveRecord::Base
	mount_uploader :document, DocumentUploader
end
