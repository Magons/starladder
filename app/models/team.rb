class Team < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'

  validates :name, presence: true, uniqueness: true

  mount_uploader :logo, TeamLogoUploader
end
