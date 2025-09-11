class Post < ApplicationRecord
  # Post has many comments; deleting a post deletes its comments
  has_many :comments, dependent: :destroy

  # バリデーション：名前は1..30文字、本文は1..280文字（X風）
  validates :name, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 280 }
end
