class SubGenre < ApplicationRecord
  searchkick

  has_many :sub_genre_translations, dependent: :destroy
  has_many :genre_sub_genres, dependent: :destroy
  has_many :genres, through: :genre_sub_genres
  has_many :title_sub_genres, dependent: :destroy
  has_many :titles, through: :title_sub_genres
end
