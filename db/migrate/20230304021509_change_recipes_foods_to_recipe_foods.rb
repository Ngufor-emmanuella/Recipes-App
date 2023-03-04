class ChangeRecipesFoodsToRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    rename_table :recipes_foods, :recipe_foods
  end
end
