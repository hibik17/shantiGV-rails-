class Post < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :genre
  belongs_to :country
  has_many :favorites, dependent: :destroy

  #validatations
  validates :title, presence: true
  validates :content, presence: true
  validates :genre, presence: true
  validates :country, presence: true
  validates :post_user, presence: true

  attachment :image

  # いいねしているかどうかの判定メソッド
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
