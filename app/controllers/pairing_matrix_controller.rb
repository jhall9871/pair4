class PairingMatrixController < ApplicationController
  def show
    data = FoodType.includes(food_subtypes: :foods)
                   .includes(food_subtypes: { pairing_scores: { wine_type: :wine_subtypes } })
                   .map do |food_type|
                     {
                       name: food_type.name,
                       subtypes: food_type.food_subtypes.map do |food_subtype|
                         {
                           name: food_subtype.name,
                           foods: food_subtype.foods.map(&:name),
                           pairing_scores: food_subtype.pairing_scores.map do |pairing_score|
                             {
                               wine_type: pairing_score.wine_type.name,
                               food_subtype: pairing_score.food_subtype.name,
                               score: pairing_score.score
                             }
                           end
                         }
                       end
                     }
                   end

    render json: data
  end
end
