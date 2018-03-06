class UsersController < ApplicationController
before_action :set_user, only: [:show, :prefs]

  def new
    @user = User.new
  end

  def create

    if @user = User.create(user_params)
      helpers.login(@user.id)
      @user.location_match(@user.location)
      @user.keyword_match(@user.keyword)
      redirect_to @user
    else
      render :new
    end
  end

  def show

  end

  def prefs
    # if (@user.location_match(@user.location) && @user.keyword_match(@user.keyword)) != nil
    #   redirect_to 'user/:id/matches'
    # else
    #   render :prefs
    # end
  end


  private

  def user_params
    params.require(:user).permit(:name, :password_digest, :location, :keyword)
  end

  def set_user

    @user = User.find(params[:id])
  end

end
