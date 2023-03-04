require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject { Recipe.new(name: 'Couche Lorraine', description: 'Slice the bread', preparation_time: 1, cooking_time: 1) }

  before { subject.save }

  it 'should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have a description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'should have preparation_time' do
    subject.preparation_time = nil
    expect(subject).to_not be_valid
  end

  it 'should have cooking_time' do
    subject.cooking_time = nil
    expect(subject).to_not be_valid
  end

  it 'name should have less than 50 characters but greater than 3 characters' do
    subject.name = ('a' * 60) && subject.name = 'a' * 2
    expect(subject).to_not be_valid
  end

  it 'description should have less than 300 characters but greater than 10 characters' do
    subject.description = ('a' * 350) && subject.description = 'a' * 9
    expect(subject).to_not be_valid
  end
end
