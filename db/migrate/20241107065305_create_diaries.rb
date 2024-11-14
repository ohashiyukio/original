class CreateDiaries < ActiveRecord::Migration[7.0]
  def change
    create_table :diaries do |t|
      t.string     :comment_text, null: false
      t.references :pet,       null: false, foreign_key: true      
      t.references :room
      t.text       :image
      t.timestamps
    end
  end
end
