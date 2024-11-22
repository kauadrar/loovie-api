class Movie < ApplicationRecord
  has_one :crew, as: :production
  has_one :cast, as: :production
end
