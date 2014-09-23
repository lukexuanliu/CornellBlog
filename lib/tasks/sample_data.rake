namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		User.create!(name:"Matt", email:"goggin13@gmail.com", password:"password")
		99.times do |n|
			user = User.create!(name:Faker::Name.name,
								email:Faker::Internet.email,
								password:"password")
			50.times do |i|
				user.micro_posts.create! content:"hello, word -#{i}"
			end
		end
	end

end
