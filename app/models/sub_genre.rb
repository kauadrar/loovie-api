class SubGenre < ApplicationRecord
  has_many :sub_genre_translations
  has_many :genre_sub_genres
  has_many :genres, through: :genre_sub_genres
  has_many :title_sub_genres, dependent: :destroy
  has_many :titles, through: :title_sub_genres
end
