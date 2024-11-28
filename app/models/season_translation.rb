class SeasonTranslation < ApplicationRecord
  belongs_to :season
  belongs_to :language
end
