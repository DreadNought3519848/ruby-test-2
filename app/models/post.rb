class Post < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true, length: { maximum: 200 }
end

