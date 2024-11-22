class Show < ApplicationRecord
  has_many :seasons
  has_one :crew, as: :production
  has_one :cast, as: :production
  has_many :genres, as: :title
  has_many :sub_genres, as: :title
end
