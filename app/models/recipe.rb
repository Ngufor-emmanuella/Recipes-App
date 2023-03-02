class Recipe < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :public, presence: true
  has_many :recipes_foods
  has_many :foods, through: :recipes_foods
end
