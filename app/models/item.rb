class Item < ApplicationRecord
  belongs_to :user
  attachment :item_image
  belongs_to :category
  belongs_to :scene
  belongs_to :season
end
