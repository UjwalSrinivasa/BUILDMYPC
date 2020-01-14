class User < ApplicationRecord
		before_save { email.downcase! }   # or self.email = email.downcase #Before saving the model execute this (email to downcase)
		validates :name,  presence: true, length: { maximum: 50 }
		VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
		validates :email, presence: true, length: { maximum: 255 },
		                  format: { with: VALID_EMAIL_REGEX },
		                  uniqueness: { case_sensitive: false } # Means both uniqueness is true and email isnt case sensitive
		has_secure_password										# very powerful tool and easy to use, need to install bcrypt gem
		validates :password, presence: true, length: { minimum: 6 }
end
