class CreateFavorites < ActiveRecord::Migration[8.1]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :animal, null: false, foreign_key: true
      t.timestamps
    end

    add_index :favorites, %i[user_id animal_id], unique: true
  end
end
