class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }

  has_many :foods, dependent: :destroy
  has_many :recipes, dependent: :destroy
end
