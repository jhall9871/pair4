class WineType < ApplicationRecord
  has_many :wine_subtypes, dependent: :destroy
  has_many :pairing_scores, dependent: :destroy
end
