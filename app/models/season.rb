class Season < ApplicationRecord
  belongs_to :show
  has_many :episodes, dependent: :nullify
  has_many :season_translations, dependent: :destroy
end
