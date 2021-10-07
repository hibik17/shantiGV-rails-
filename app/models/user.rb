class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         # 以下を追加
         # google以外の認証をする場合は %i[twitter, facebook]などとなります
         :omniauthable, omniauth_providers: %i[google_oauth2]

  protected
  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)

    unless user
      user = User.create(name:     auth.info.name,
                        provider: auth.provider,
                        uid:      auth.uid,
                        token:    auth.credentials.token,
                        password: Devise.friendly_token[0, 20],
                        meta:     auth.to_yaml)
    end
  end

end
