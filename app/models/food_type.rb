class FoodType < ApplicationRecord
  has_many :food_subtypes, dependent: :destroy
end
