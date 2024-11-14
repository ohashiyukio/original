class Question < ApplicationRecord 
  has_one_attached :image 
  belongs_to :pet 
  has_many :questions_answers, dependent: :destroy 
  belongs_to :user 

  def self.search(search) 
    if search.present? 
      Question.where('symptoms LIKE ?', "%#{search}%") 
    else 
      Question.all 
    end 
  end 

  def was_attached? 
    self.image.attached? 
  end 
end