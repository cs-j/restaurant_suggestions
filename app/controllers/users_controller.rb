class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :profile]

  def index
  end

  def new
    @user = User.new
  end

  def create
    if @user = User.create(user_params)
      # helpers.login(@user.id)
      current_user(@user.id)
      @user.location_match(@user.location)
      @user.keyword_match(@user.keyword)
      @user.cuisine_match(@user.cuisine)
      redirect_to edit_user_path(@user)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      UserRestaurant.delete_all
      @user.location_match(@user.location)
      @user.keyword_match(@user.keyword)
      @user.cuisine_match(@user.cuisine)
      redirect_to @user
    else
      render :edit
    end
  end

  def profile
  end


  private

  def user_params
    params.require(:user).permit(:name, :password_digest, :location, :keyword, :cuisine)
  end

  def set_user

    @user = User.find(params[:id])
  end

end
