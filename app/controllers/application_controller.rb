class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #Create a flash alert if the user dont hae permissions to perform action

  rescue_from CanCan::AccessDenied do |exception|
  	redirect_to root_url, :alert => exception.message
  end	
end
