class Calendar < ApplicationRecord
  belongs_to :user
  attachment :day_image
end
