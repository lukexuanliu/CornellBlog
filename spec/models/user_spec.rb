require 'rails_helper'

describe User do

	before(:each) do 
		@user = User.new(name: 'Example User', email: 'user@example.com', password: 'abcd1234')
		
	end

	describe 'with valid attributes' do
		it 'should be valid' do
			expect(@user).to be_valid
		end
	end

	describe 'without a name' do
		before do
			@user.name = ''
		end

		it 'should not be valid' do
			expect(@user).not_to be_valid
		end

	end

	describe 'without a email' do
		before do
			@user.email = ''
		end

		it 'should not be valid' do
			expect(@user).not_to be_valid
		end

	end

	describe "without a password" do
		before do
			@user.password = ""
		end

		it "should not be valid" do
			expect(@user).not_to be_valid
		end
	end

	describe "hashed_password" do
		it "should be populated after the user has been saved" do
			@user.save
			expect(@user.hashed_password).not_to be_blank
		end
	end

	describe "salt" do
		it "should be populated after the user has been saved" do
			@user.save
			expect(@user.salt).not_to be_blank
		end
	end

	describe "with valid attributes" do

		it "should be valid" do
			expect(@user).to be_valid
		end

		it "should be valid if it has an encrypted_password but no password" do
			@user.save
			@user.password = nil
			expect(@user).to be_valid
		end
	end

	describe "authenticate" do

		before do
			@user.save
		end

		it "should return the user with correct credentials" do
			expect(User.authenticate(@user.email, @user.password)).to eql(@user)
		end

		it "should return nil if the given email does not exist" do
			expect(User.authenticate("noone@example.com", @user.password)).to be_nil
		end

		it "should return nil if the wrong password is provided" do
			expect(User.authenticate(@user.email, "wrong_password")).to be_nil
		end
	end 


end