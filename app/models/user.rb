class User < ActiveRecord::Base
	has_many :micro_posts

	validates :name, presence: true, 
		length: { minimum:4, maximum:50 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, 
		format: { with: VALID_EMAIL_REGEX },
		uniqueness: { case_sensitive: false }

end
