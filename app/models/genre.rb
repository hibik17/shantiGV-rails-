class Genre < ApplicationRecord
  # association
  has_many :posts
  # validation
  # validates :name, presence: true
  def self.genre_search(keyword)
    find_by(["name like?", "%#{keyword}%"])
  end
end
