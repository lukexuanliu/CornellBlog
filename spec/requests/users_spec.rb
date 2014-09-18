require 'rails_helper'

describe "GET /users/id" do

	before do
		@user = User.create! name: "Matt", email: "goggin13@gmail.com", password: "igotmypass"
		3.times { |i| @user.micro_posts.create! content: "hello world - #{i}" }
	end

	it "should display the number of posts the user has" do
		visit user_path(@user)
		expect(page).to have_content("3 MicroPosts")
	end

	it "should list the content for each micro post " do
		visit user_path(@user)
		3.times do |i|
			expect(page).to have_content "hello world - #{i}"
		end
	end
end