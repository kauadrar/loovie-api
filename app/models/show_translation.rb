class ShowTranslation < ApplicationRecord
  searchkick word_start: [ :name ]
  belongs_to :language
  belongs_to :show
  scope :search_import, -> { includes(:show) }

  def search_data
    attributes.merge(
      original_name: show.original_name,
      original_language: show.original_language,
      release_date: show.release_date,
      vote_average: show.vote_average,
      vote_count: show.vote_count,
      language_code: language.code,
      popularity: show.popularity,
      adult: show.adult,
      type: "show"
    )
  end
end
