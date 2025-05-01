class PairingScore < ApplicationRecord
  belongs_to :wine_type
  belongs_to :food_subtype
end
