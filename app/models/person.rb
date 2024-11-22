class Person < ApplicationRecord
  has_many :crew_members, dependent: :destroy
  has_many :crews, through: :crew_members
end
