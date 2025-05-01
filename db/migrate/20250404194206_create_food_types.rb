class CreateFoodTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :food_types do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    add_index :food_types, :name, unique: true
  end
end
