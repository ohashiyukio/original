class CreateQuestionsAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :questions_answers do |t|
      t.integer :user_id
      t.integer :question_id
      t.text :text
      t.timestamps
    end
  end
end
