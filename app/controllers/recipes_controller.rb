class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      flash[:notice] = 'Recipe was successfully created'
      redirect_to user_recipes_path(params[:user_id])
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def public_recipes
    @recipes = Recipe.where(public: true)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = 'Recipe was successfully removed'
    redirect_to user_recipes_path(params[:user_id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
