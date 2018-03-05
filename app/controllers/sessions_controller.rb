class SessionController < ApplicationController
  def create
    if params[:user] == nil || params[:user].empty?
      redirect_to '/login'
    else
      helpers.login(params[:user][:id])
      redirect_to '/'
    end
  end

  def new
  end
end
