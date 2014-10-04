class User < ActiveRecord::Base
	has_many :micro_posts
	has_many :relationships, foreign_key: "follower_id", dependent: :destroy
	has_many :followed_users, through: :relationships, source: :followed

	attr_accessor :password

	has_attached_file :avatar,
					:style => {
						:medium => "300x300>",
						:thumb => "100x100>"
					},
					:default_url => "/images/:style/missing.png"

	validates_attachment_file_name :avatar, 
								:matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]

	validates :name, presence: true,
		length: { minimum:4, maximum:50 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true,
		format: { with: VALID_EMAIL_REGEX },
		uniqueness: { case_sensitive: false }

	validates :password, presence: true, if: "hashed_password.blank?"

	before_save :encrypt_password

	def encrypt_password
		self.salt ||= Digest::SHA256.hexdigest("--#{Time.now.to_s}--#{email}--")
		self.hashed_password = encrypt(password)

	end

	def encrypt(raw_password)
		Digest::SHA256.hexdigest("--#{salt}--#{raw_password}--")

	end

	def password_is?(raw_password)
		self.hashed_password == encrypt(raw_password)

	end

	# If there is a user in the database with the given email, and
	# the password matches theirs, returns the user.
	# Otherwise, returns nil
	def self.authenticate(auth_email, auth_password)
		user = User.find_by_email(auth_email)
		(user && user.password_is?(auth_password)) ? user : nil
	end

	def feed(paginate_options={page: 1})
		micro_posts.paginate(paginate_options)
		
	end

end
