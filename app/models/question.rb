class Question < ApplicationRecord
  has_one_attached :image
  belongs_to :pet
  has_many :questions_answers, dependent: :destroy
  belongs_to :user

  # validates :symptoms, :progress, :medicine, :hospital, :habit, 
  # :favorite_food, :favorite_place, presence: true

  def was_attached?
    self.image.attached?
  end
end