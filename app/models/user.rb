
# class EmailValidator < ActiveModel::EachValidator
#   def validate_each(record, attribute, value)
#     unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
#       record.errors[attribute] << (options[:message] || "is not an email")
#     end
#   end
# end

class User < ActiveRecord::Base
	has_many :tweets
	has_many :follows
	

	validates :profile_name, :email, :password_digest, presence: true
	# validates :email, uniqueness: true, email: true, on: :create
	validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
	validates :password, length: { in: 6..20 }
	
	has_secure_password
	attr_accessor :password_confirmation


end
