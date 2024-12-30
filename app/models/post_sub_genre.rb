class PostSubGenre < ApplicationRecord
  belongs_to :post
  belongs_to :sub_genre
end
