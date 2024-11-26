class TitleSubGenre < ApplicationRecord
  belongs_to :title, polymorphic: true
  belongs_to :sub_genre
end
