require 'rails_helper'

RSpec.describe 'Show Recipe', type: :feature do
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
  end
end
