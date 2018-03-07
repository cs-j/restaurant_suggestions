class ApplicationController < ActionController::Base
  # helper_method :current_user, :logged_in?, :require_login
  protect_from_forgery with: :exception
  before_action :current_user
  helper_method :require_logged_in

  def current_user
    @user = (User.find_by(id: session[:user_id]) || User.new)
  end

  def logged_in?
    current_user.id != nil
  end

  # def require_logged_in
  #   return redirect_to(controller: 'sessions', action: 'new') unless logged_in?
  # end
  #
  # def current_user
  #   session[:user_id] ||= nil
  #   # @current_user ||= User.find_by(id: session[:user_id])
  # end
  #
  # def logged_in?
  #   !current_user.nil?
  # end
  #
  # def require_login
  #   unless logged_in?
  #     flash[:error] = "Sign in to see that page."
  #     redirect_to new_user_path
  #   end
  # end

  # def current_user
  #   session[:user_id] ||= nil
  # end

  # def logged_in?
  #   if session[:user_id] != nil
  #     true
  #   else
  #     false
  #   end
  # end

  # def login(user_id)
  #   session[:user_id] = user_id
  # end
end
