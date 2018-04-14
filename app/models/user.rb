class User < ApplicationRecord
  has_many :teams, dependent: :destroy

  def self.from_omniauth(auth)
    find_or_create_by(uid: auth.uid, provider: auth.provider) do |user|
      user.nick  = auth.info.nick
      user.email = auth.info.email
      user.uuid = SecureRandom.uuid
    end
  end
end
