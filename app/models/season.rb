class Season < ApplicationRecord
  belongs_to :show
  has_many :episodes
  has_many :season_translations, dependent: :destroy
end
