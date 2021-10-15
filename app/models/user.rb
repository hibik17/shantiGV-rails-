class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :omniauthable,
  omniauth_providers: [:google_oauth2]

  protected
    def self.from_omniauth(access_token)
      data = access_token.info
      user = User.where(email: data['email']).first
      unless user
          user = User.create(name: data['name'],
             email: data['email'],
             password: Devise.friendly_token[0,20]
          )
      end
      user
    end

    # association
    has_many :posts, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :post_comments, dependent: :destroy
    # validates
    validates :name, presence: true
    validates :email, presence: true
    # image setting
    attachment :profile_image

    #paranoia
    acts_as_paranoid
end
