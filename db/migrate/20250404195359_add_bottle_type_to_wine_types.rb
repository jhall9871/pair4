class AddBottleTypeToWineTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :bottle_types do |t|
      t.string :name
      t.string :image_url
      t.timestamps
    end

    add_reference :wine_types, :bottle_type, foreign_key: true
  end
end
