class Episode < ApplicationRecord
  belongs_to :season
  has_one :crew, as: :production
  has_one :cast, as: :production
  has_many :production_translations, as: :production, dependent: :destroy
end
