class CreateWineSubtypes < ActiveRecord::Migration[7.1]
  def change
    create_table :wine_subtypes do |t|
      t.string :name
      t.string :description
      t.references :wine_type, null: false, foreign_key: true

      t.timestamps
    end
    add_index :wine_subtypes, :name, unique: true
  end
end
