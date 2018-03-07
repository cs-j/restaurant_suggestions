class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :require_login

  def current_user
    session[:name]
  end

  def require_login
    redirect_to '/sessions/new' unless current_user
  end

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

  def login(user_id)
    session[:user_id] = user_id
  end
end
