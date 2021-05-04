class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :book

# 1投稿につき１人１いいね
  validates_uniqueness_of :book_id, scope: :user_id
end
