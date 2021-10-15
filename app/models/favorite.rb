class Favorite < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :post
end
