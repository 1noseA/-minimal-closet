class Coordinate < ApplicationRecord
  belongs_to :user
  attachment :image
  validates :image, presence: true

  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    avorites.where(user_id: user.id).exists?
  end
end
