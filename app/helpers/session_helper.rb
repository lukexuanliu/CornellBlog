module SessionHelper
	def sign_in(user)
		cookies[:current_user_id] = user.id
		self.current_user = user
	end

	def sign_out(user)
		cookies.delete :current_user_id
		
	end

	def current_user=(user)
		@current_user = user
		
	end

	def current_user
		@current_user ||= User.find_by_id(cookies[:current_user_id])
	end

	def signed_in?
		!current_user.nil?
	end

	def redirect_home_if_signed_in
		redirect_to root_path if signed_in?
	end
end
