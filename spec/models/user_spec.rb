require 'rails_helper'

describe User do

	before(:all) do 
		@user = User.new(name: 'Example User', email: 'user@example.com')
		
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


end