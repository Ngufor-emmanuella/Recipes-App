require 'rails_helper'

RSpec.describe 'Show Foods', type: :feature do
  describe 'Food' do
    before(:each) do
      @user = User.create!(name: 'Cathy', email: 'cathy@gmail.com', password: 'mightyGod',
                           password_confirmation: 'mightyGod')

      @food = @user.foods.create!(name: 'Beef', measurement_unit: 'kg', price: 20, quantity: 3)

      visit user_foods_path(@user)
    end

    it 'shows the food name' do
      expect(page).to have_content('Beef')
    end

    it 'shows the measurement_unit' do
      expect(page).to have_content('kg')
    end

    it 'shows the food price' do
      expect(page).to have_content(20)
    end

    it 'shows the food quantity' do
      expect(@food.quantity).to eq(3)
    end
  end
end
