require 'rails_helper'

RSpec.describe 'Show Recipes', type: :feature do
  describe 'Recipe' do
    before(:each) do
      @user = User.create!(name: 'Cathy', email: 'cathy@gmail.com', password: 'mightyGod',
                           password_confirmation: 'mightyGod')

      @recipe = @user.recipe.create!(name: 'Banana cake', description: 'Slice the bananas', preparation_time: 1,
                                     cooking_time: 1)

      visit user_recipes_path(@user)
    end

    it 'shows the recipe name' do
      expect(page).to have_content('Banana cake')
    end

    it 'shows the recipe description' do
      expect(page).to have_content('Slice the bananas')
    end

    it 'has link to recipe details' do
      click_link 'Banana cake'
      expect(page).to have_current_path user_recipe_path(@recipe.user, @recipe)
    end
  end
end
