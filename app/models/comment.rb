class Comment < ApplicationRecord
  # Comment belongs to a Post
  belongs_to :post

  # バリデーション：名前と内容は必須、内容は長すぎないよう制限
  validates :name, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 1000 }
end
