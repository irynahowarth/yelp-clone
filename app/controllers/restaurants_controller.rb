class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def new
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update(params.require(:restaurant).permit(:name, :rating))
      redirect_to @restaurant
    else
      render 'edit'
    end
  end

  def create
    @restaurant = Restaurant.new(params.require(:restaurant).permit(:name, :rating))
    @restaurant.save

    redirect_to @restaurant
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end

end
