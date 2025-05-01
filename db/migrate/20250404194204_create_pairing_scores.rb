class CreatePairingScores < ActiveRecord::Migration[7.1]
  def change
    create_table :pairing_scores do |t|
      t.integer :score
      t.references :wine_type, null: false, foreign_key: true
      t.references :food_subtype, null: false, foreign_key: true

      t.timestamps
    end
  end
end
