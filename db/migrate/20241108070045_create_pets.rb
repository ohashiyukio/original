class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :pets_name,  null: false 
      t.string :kind_id,       null: false 
      t.string :sex_id,        null: false
      t.string :birthday_id  
      t.string :family_day_id
      t.text   :image
      t.references :user,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
