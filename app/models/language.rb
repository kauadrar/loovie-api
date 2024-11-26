class Language < ApplicationRecord
  has_many :genre_translations
  has_many :production_translations
end
