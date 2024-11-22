class SubGenre < ApplicationRecord
  belongs_to :title, polymorphic: true
end
