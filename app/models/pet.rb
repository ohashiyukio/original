class Pet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :sex
  has_one_attached :image

   #空の投稿を保存できないようにする
   validates :pets_name, :kind, :sex, presence: true

end
