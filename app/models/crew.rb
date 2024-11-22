class Crew < ApplicationRecord
  belongs_to :production
  has_many :crew_members, dependent: :destroy
  has_many :people, through: :crew_members
end
