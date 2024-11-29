class Show < ApplicationRecord
  searchkick

  has_many :seasons, dependent: :destroy
  has_one :crew, as: :production
  has_one :cast, as: :production
  has_many :show_translations, dependent: :destroy
  has_many :title_genres, as: :title, dependent: :destroy
  has_many :genres, through: :title_genres
  has_many :title_sub_genres, as: :title, dependent: :destroy
  has_many :sub_genres, through: :title_sub_genres
end
