class CastMember < ApplicationRecord
  belongs_to :person
  belongs_to :cast
  belongs_to :character
end
