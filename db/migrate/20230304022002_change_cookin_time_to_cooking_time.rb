class ChangeCookinTimeToCookingTime < ActiveRecord::Migration[7.0]
  def change
    rename_column :recipes, :cookin_time, :cooking_time
  end
end
