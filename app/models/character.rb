class Character < ApplicationRecord
  has_many :cast_members, dependent: :destroy
  has_many :people, through: :cast_members
end
