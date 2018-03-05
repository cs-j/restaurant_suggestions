class UsersController < ApplicationController
before_action :set_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    if @user = User.create(user_params)
      helpers.login(@user.id)
      redirect_to @user
    else
      render :new
    end
  end

  def show
  end


  private

  def user_params
    params.require(:user).permit(:name, :password_digest)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
