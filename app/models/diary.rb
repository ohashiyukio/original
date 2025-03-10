class Diary < ApplicationRecord
  has_one_attached :image
  belongs_to :pet

  validates :comment_text, presence: true

  def was_attached?
    image.attached?
  end
end
