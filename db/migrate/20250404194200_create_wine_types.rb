class CreateWineTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :wine_types do |t|
      t.string :name
      t.string :image_url
      t.string :description

      t.timestamps
    end
    add_index :wine_types, :name, unique: true
  end
end
