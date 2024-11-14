class RemoveImageFromQuestions < ActiveRecord::Migration[7.0]
  def change
    remove_column :questions, :image, :text
  end
end