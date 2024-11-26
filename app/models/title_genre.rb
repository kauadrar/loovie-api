class TitleGenre < ApplicationRecord
  belongs_to :title, polymorphic: true
  belongs_to :genre
end
