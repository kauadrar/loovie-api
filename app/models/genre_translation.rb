class GenreTranslation < ApplicationRecord
  belongs_to :language
  belongs_to :genre
end
