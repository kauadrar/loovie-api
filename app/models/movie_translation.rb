class MovieTranslation < ApplicationRecord
  searchkick word_start: [ :name ]
  belongs_to :language
  belongs_to :movie
  scope :search_import, -> { includes(:movie) }

  def search_data
    attributes.merge(
      original_name: movie.original_name,
      original_language: movie.original_language,
      release_date: movie.release_date,
      vote_average: movie.vote_average,
      vote_count: movie.vote_count,
      language_code: language.code,
      popularity: movie.popularity,
      adult: movie.adult,
      type: "movie"
    )
  end
end
