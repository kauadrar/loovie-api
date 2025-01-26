class Episode < ApplicationRecord
  belongs_to :season
  has_one :crew, as: :production
  has_one :cast, as: :production
  has_many :episode_translations, dependent: :destroy
  has_many :tmdb_logs, as: :entity, dependent: :destroy
end
