class AddImageUrlToFoodSubtypes < ActiveRecord::Migration[7.1]
  def change
    add_column :food_subtypes, :image_url, :string
  end
end
