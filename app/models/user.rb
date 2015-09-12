class User < ActiveRecord::Base
	# Use built-in rails support for password protection
  	has_secure_password

	# Validations
  	validates_presence_of :last_name, :first_name, :email
  	validates_format_of :phone, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/, message: "should be 10 digits (area code needed) and delimited with dashes only"
  	validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, message: "is not a valid format"
  	validates :username, presence: true, uniqueness: { case_sensitive: false}
	validates_presence_of :password, on: :create 
	validates_presence_of :password_confirmation, on: :create 
	validates_confirmation_of :password, on: :create, message: "does not match"
	validates_length_of :password, minimum: 4, message: "must be at least 4 characters long", allow_blank: true

	def proper_name
		"#{first_name} #{last_name}"
	end
end
