class ProductionTranslation < ApplicationRecord
  belongs_to :language
  belongs_to :production, polymorphic: true
end
