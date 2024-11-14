class QuestionsAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  has_many :questions_answers
end
