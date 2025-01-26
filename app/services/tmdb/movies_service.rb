module Tmdb
  class MoviesService < TmdbService
    def discover_movies(page: 1, sort_by: "vote_count", sort_order: "desc")
      query_params = {
        language: @language.code,
        sort_by: "#{sort_by}.#{sort_order}",
        page:
      }.to_query

      response = @tmdb_api["/discover/movie?#{query_params}"].get

      tmdb_movies = JSON.parse(response.body)["results"]

      tmdb_movies.each do |tmdb_movie|
        movie = create_movie(tmdb_movie)

        next unless movie.present?

        add_genres(tmdb_movie["genre_ids"], movie)
      end
    end

    def create_movie(tmdb_movie)
      tmdb_id = tmdb_movie["id"]

      return nil if Movie.exists?(tmdb_id: tmdb_id)

      movie = Movie.create(
        tmdb_id:,
        original_name: tmdb_movie["original_title"],
        original_language: tmdb_movie["original_language"],
        backdrop_path: tmdb_movie["backdrop_path"],
        release_date: tmdb_movie["release_date"].present? ? Date.parse(tmdb_movie["release_date"]) : nil,
        vote_average: tmdb_movie["vote_average"],
        vote_count: tmdb_movie["vote_count"],
        adult: tmdb_movie["adult"],
        popularity: tmdb_movie["popularity"],
      )

      MovieTranslation.create(
        movie:,
        language: @language,
        name: tmdb_movie["title"],
        poster_path: tmdb_movie["poster_path"],
        overview: tmdb_movie["overview"],
      )
    end
  end
end
