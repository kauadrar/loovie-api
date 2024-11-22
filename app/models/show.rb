class Show < ApplicationRecord
  has_many :seasons
  has_one :crew, as: :production
  has_one :cast, as: :production
end
