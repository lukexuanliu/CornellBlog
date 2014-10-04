class RelationshipsController < ApplicationController
	# params[:relationship][:followed_id] contains the id of the user to follow;
	# use our functions from the last exercise to have the current_user follow them
	def create
		# your code here; populate the @user variable and follow them
		respond_to do |format|
			@user = User.find(params[:relationship][:followed_id])
			current_user.follow! @user

			format.html { redirect_to @user }
			format.js
		end

	end

	# params[:relationship][:followed_id] contains the id of the user to follow;
	# use our functions from the last exercise to have the current_user UNfollow them
	def destroy
		# your code here, populate the @user variable and unfollow them
		respond_to do |format|
			@user = User.find(params[:relationship][:followed_id])
			current_user.unfollow! @user

			format.html { redirect_to @user }
			format.js
		end
	end
end