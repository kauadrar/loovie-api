class GenreSubGenre < ApplicationRecord
  belongs_to :genre
  belongs_to :sub_genre
end
