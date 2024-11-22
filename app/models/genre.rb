class Genre < ApplicationRecord
  belongs_to :title, polymorphic: true
end
