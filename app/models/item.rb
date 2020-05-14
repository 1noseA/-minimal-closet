class Item < ApplicationRecord
  belongs_to :user
  attachment :item_image
  validates :item_image, presence: true
  validates :category_id, presence: true
  validates :scene_id, presence: true
  validates :season_id, presence: true
  belongs_to :category, optional: true
  belongs_to :scene, optional: true
  belongs_to :season, optional: true

  has_many :likes, dependent: :destroy
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
