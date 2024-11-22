class Movie < ApplicationRecord
  has_one :crew, as: :production
end
