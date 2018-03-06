class SessionsController < ApplicationController
  def new
  end

  def create
   @user = User.find_by(name: params[:user][:name])
   session[:user_id] = @user.id

   if session[:user_id] == nil
     render :new
   else
     redirect_to user_path(@user)
   end
 end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end


end
