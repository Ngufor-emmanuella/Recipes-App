class AddRecipeRefToRecipesFood < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipes_foods, :recipe, foreign_key: true
  end
end
