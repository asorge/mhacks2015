class Application < ActiveRecord::Base
	mount_uploader :file, FileUploader
end
