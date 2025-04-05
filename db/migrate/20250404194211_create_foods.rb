class CreateFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.references :food_subtype, null: false, foreign_key: true

      t.timestamps
    end
    add_index :foods, :name, unique: true
  end
end
