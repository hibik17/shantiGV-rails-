class Post < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :genre
  belongs_to :country

  #validatations
  validates :title, presence: true
  validates :content, presence: true
  validates :genre, presence: true
  validates :country, presence: true
  validates :post_user, presence: true

  attachment :image
end
