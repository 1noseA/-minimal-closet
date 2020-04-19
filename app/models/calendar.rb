class Calendar < ApplicationRecord
  belongs_to :user
  attachment :day_image
  validates :day_image, presence: true
end
