class Pet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sex

   #空の投稿を保存できないようにする
   validates :title, :text, presence: true

end
