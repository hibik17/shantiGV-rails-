class Country < ApplicationRecord
  # association
  has_many :posts
  # validation
  validates :name, presence: true
  def self.country_search(keyword)
    where(["name like?", "%#{keyword}%"])
  end
end
