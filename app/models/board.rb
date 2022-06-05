class Board < ApplicationRecord
  has_many :likes
  belongs_to :user

  def like_count
    likes.count
  end
end
