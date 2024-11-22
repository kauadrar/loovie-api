class Movie < ApplicationRecord
  has_one :crew, as: :production
  has_one :cast, as: :production
  has_many :genres, as: :title
  has_many :sub_genres, as: :title
end
