class CreateFoodSubtypes < ActiveRecord::Migration[7.1]
  def change
    create_table :food_subtypes do |t|
      t.string :name
      t.string :description
      t.references :food_type, null: false, foreign_key: true

      t.timestamps
    end
    add_index :food_subtypes, :name, unique: true
  end
end
