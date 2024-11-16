class Pet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :sex
  has_one_attached :image

  validates :pets_name, :kind, :sex, presence: true
end
