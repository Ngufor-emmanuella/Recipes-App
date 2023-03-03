class FoodsController < ApplicationController
  # GET /foods or /foods.json
  def index
    @foods = Food.all
  end

  # GET /foods/1 or /foods/1.json
  def show; end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # POST /foods or /foods.json
  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id

    if @food.save
      flash[:notice] = 'Food was successfully created'
      redirect_to user_foods_path(current_user)
    else
      render :new
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food.destroy

    flash[:notice] = 'Food was successfully deleted'
    redirect_to user_foods_path(params[:user_id])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_food
    @food = Food.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
