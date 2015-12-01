class SessionsController < ApplicationController
	before_action :set_user, only: [:create]
	before_action :require_login, only: [:destroy]

	def create
		if @user
			redirect_back_or_to root_url
		else
			flash.now[:danger] = 'Invalid email/password combination'
			render "new"
		end
	end

	def destroy
		logout
		redirect_to root_url
	end

	private
	def set_user
		@user = login(params[:sessions][:email], params[:sessions][:password])
	end

	def session_params
		params.require(:user).permit(:email, :password)
	end
end
