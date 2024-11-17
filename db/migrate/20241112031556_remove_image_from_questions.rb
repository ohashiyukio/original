class RemoveImageFromQuestions < ActiveRecord::Migration[7.0]
  def change
    # カラムが存在する場合のみ削除するように変更
    if column_exists?(:questions, :image)
      remove_column :questions, :image, :text
    end
  end
end