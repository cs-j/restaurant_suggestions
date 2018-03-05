module ApplicationHelper
  def login(user_id)
    session[:user_id] = user_id
  end
end
