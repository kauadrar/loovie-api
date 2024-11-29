class Season < ApplicationRecord
  belongs_to :show
  has_many :episodes, dependent: :destroy
  has_many :season_translations, dependent: :destroy
end
