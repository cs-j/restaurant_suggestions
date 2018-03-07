class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.search(params[:query])
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

end
