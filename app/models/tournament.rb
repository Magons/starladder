class Tournament < ApplicationRecord
  has_many :participations, dependent: :destroy
  has_many :teams, through: :participations
end
