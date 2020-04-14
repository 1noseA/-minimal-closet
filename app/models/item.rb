class Item < ApplicationRecord
  belongs_to :user
  attachment :item_image
  belongs_to :category,optional: true
  belongs_to :scene,optional: true
  belongs_to :season,optional: true

  has_many :likes, dependent: :destroy
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
