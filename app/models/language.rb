class Language < ApplicationRecord
  has_many :genre_translations
  has_many :movie_translations
  has_many :show_translations
end
