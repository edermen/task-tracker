class ApplicationController < ActionController::Base
	#includes
	include CanCan::ControllerAdditions



  protect_from_forgery with: :exception
	before_filter :require_login, :except => [:not_authenticated]


	rescue_from CanCan::AccessDenied do |exception|
		redirect_to root_url, :alert => exception.message
	end


	protected

	def not_authenticated

		redirect_to login_path

	end

end
