class Show < ApplicationRecord
  has_many :seasons
  has_one :crew, as: :production
end
