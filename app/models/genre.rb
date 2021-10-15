class Genre < ApplicationRecord
  # association
  has_many :posts
  # validation
  # validates :name, presence: true
end
