class CreateDiaries < ActiveRecord::Migration[7.0]
  def change
    create_table :diaries do |t|
      t.text :symptoms
      t.text :progress 
      t.string :hospital 
      t.string :pet_id 
      t.string :habit 
      t.string :favorite_food 
      t.string :favorite_place 
      t.timestamps
    end
  end
end
