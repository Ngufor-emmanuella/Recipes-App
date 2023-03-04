require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  subject { RecipeFood.new(quantity: 2) }

  before { subject.save }

  it 'should have a quantity' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end
end
