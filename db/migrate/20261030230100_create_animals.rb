class CreateAnimals < ActiveRecord::Migration[8.1]
  def change
    create_table :animals do |t|
      t.string :name, null: false
      t.string :scientific_name, null: false
      t.text :summary, null: false
      t.string :habitat, null: false
      t.string :image_url
      t.string :taxonomy, null: false
      t.timestamps
    end
  end
end
