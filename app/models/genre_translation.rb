class GenreTranslation < ApplicationRecord
  searchkick

  belongs_to :language
  belongs_to :genre
end
