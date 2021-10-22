class Genre < ApplicationRecord
  # association
  has_many :posts
  # validation
  validates :name, presence: true
  def self.genre_search(keyword)
    where(["name like?", "%#{keyword}%"])
  end
end
