class Country < ApplicationRecord
  # association
  has_many :posts
  # validation
  # validates :name, presence: true
  def self.country_search(keyword)
    find_by(["name like?", "%#{keyword}%"])
  end
end
