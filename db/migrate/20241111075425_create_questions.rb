class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.text :symptoms
      t.text :progress
      t.string :medicine
      t.string :hospital
      t.string :habit
      t.string :favorite_food
      t.string :favorite_place
      t.references :pet, null: false, foreign_key: true  
      t.timestamps
    end
  end
end