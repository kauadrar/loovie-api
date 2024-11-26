class Genre < ApplicationRecord
  has_many :genre_translations
  has_many :genre_sub_genres
  has_many :sub_genres, through: :genre_sub_genres
end
