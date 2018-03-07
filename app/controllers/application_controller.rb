class ApplicationController < ActionController::Base
  # helper_method :current_user, :logged_in?, :require_login
  protect_from_forgery with: :exception
  before_action :current_user
  helper_method :require_logged_in, :current_user, :logged_in?

  def current_user
    @user = (User.find_by(id: session[:user_id]) || User.new)
  end

  def logged_in?
    current_user.id != nil
  end

end
