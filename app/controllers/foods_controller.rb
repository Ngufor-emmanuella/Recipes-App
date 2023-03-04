class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user

    if @food.save
      flash[:notice] = 'Food was successfully created'
      redirect_to user_foods_path(params[:user_id])
    else
      render :new
    end
  end

  def show
    @food = Food.find(params[:id])
  end

  def shopping_list
    @foods = Food.all
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    flash[:notice] = 'Food was successfully deleted'
    redirect_to user_foods_path(params[:user_id])
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
