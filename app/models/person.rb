class Person < ApplicationRecord
  has_many :crew_members, dependent: :destroy
  has_many :crews, through: :crew_members
  has_many :cast_members, dependent: :destroy
  has_many :casts, through: :cast_members
  has_many :characters, through: :cast_members
end
