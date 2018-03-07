class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:user][:password])
    return redirect_to(controller: 'sessions', action: 'new') unless user
    session[:user_id] = user.id
    redirect_to user
  end

  def destroy
    session.delete :user_id
    redirect_to '/login'
  end

  # def new
  # end
  #
  # def create
  #   byebug
  #   user = User.find_by(name: params[:name])
  #   user = user.try(:authenticate, params[:password])
  #   return redirect_to(login_path) unless user
  #   session[:user_id] = user.id
  #   @user = user
  #   redirect_to controller: "user", action: "edit"
  #  #
  #  #
  #  # @user = User.find_by(name: params[:user][:name])
  #  #
  #  # session[:user_id] = @user.id
  #  #
  #  # if session[:user_id] == nil
  #  #   render :new
  #  # else
  #  #   redirect_to user_path(@user)
  #  # end
  # end
  #
  # def destroy
  #   session.delete :user_id
  #   redirect_to '/'
  # end
end
