class FoodSubtype < ApplicationRecord
  belongs_to :food_type
  has_many :foods, dependent: :destroy
  has_many :pairing_scores, dependent: :destroy
end
