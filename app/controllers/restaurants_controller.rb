class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show reviews]

  def index
    @restaurants = Restaurant.all
  end

  def show; end

  def reviews; end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save # false / true
      redirect_to restaurants_path, notice: 'Restaurant was successfully created.'
    else
      # render the 'new.html.erb' view
      render :new
      # redirect_to new_restaurant_path # NOOOOO
    end
  end


      private

      def set_restaurant
        @restaurant = Restaurant.find(params[:id])
      end

      def restaurant_params
        params.require(:restaurant).permit(:name, :address, :phone_number, :category)
      end
    end
