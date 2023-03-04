require 'rails_helper'

RSpec.describe Food, type: :model do
  subject { Food.new(name: 'Beef', measurement_unit: 'kg', price: 20, quantity: 1) }

  before { subject.save }

  it 'should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have a measurement_unit' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end

  it 'should have price' do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it 'should have quantity' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end
end
