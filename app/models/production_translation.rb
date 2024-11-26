class ProductionTranslation < ApplicationRecord
  searchkick
  scope :search_import, -> { includes(:production) }

  belongs_to :language
  belongs_to :production, polymorphic: true

  def search_data
    data = attributes.merge(
      original_name: production.original_name,
      original_language: production.original_language,
      release_date: production.release_date,
      vote_average: production.vote_average,
      vote_count: production.vote_count,
      language_code: language.code
    )

    if production.is_a?(Movie) || production.is_a?(Show)
      data.merge!(popularity: production.popularity)
    end

    data
  end
end
