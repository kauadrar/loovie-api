class CrewMember < ActiveRecord::Base
  belongs_to :crew
  belongs_to :person
end
