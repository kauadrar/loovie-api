class Genre < ApplicationRecord
  searchkick

  has_many :genre_translations
  has_many :genre_sub_genres
  has_many :sub_genres, through: :genre_sub_genres
  has_many :title_genres, dependent: :destroy
  has_many :titles, through: :title_genres
end
