class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    @user.location_match(@user.location)
    @user.keyword_match(@user.keyword)
    @user.cuisine_match(@user.cuisine)
    return redirect_to new_user_path unless @user.save
    session[:user_id] = @user.id
    redirect_to edit_user_path(@user)

      # helpers.login(@user.id)
      # byebug
      # redirect_to edit_user_path(@user)
    # else
    #   render :new
    # end
  end

  def show
    redirect_to @user unless params[:id].to_i == current_user.id
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


  private

  def user_params
    params.require(:user).permit(:name, :password, :location, :keyword, :cuisine)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
