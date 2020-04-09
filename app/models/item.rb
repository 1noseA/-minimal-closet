class Item < ApplicationRecord
  belongs_to :user
  attachment :item_image
  belongs_to :category,optional: true
  belongs_to :scene,optional: true
  belongs_to :season,optional: true
end
