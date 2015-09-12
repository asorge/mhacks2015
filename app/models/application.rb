class Application < ActiveRecord::Base
	mount_uploader :document, FileUploader
end
