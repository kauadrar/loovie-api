class Episode < ApplicationRecord
  belongs_to :season
  has_one :crew, as: :production
end
