class AddFoodRefToRecipesFood < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipes_foods, :foods, foreign_key: true
  end
end
