class MicroPost < ActiveRecord::Base
	validates :user_id, presence: true
	validates :content, presence: true, 
		length: { minimum:5, maximum:140 }
end
