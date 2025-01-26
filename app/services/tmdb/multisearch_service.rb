module Tmdb
  class MultisearchService < TmdbService
    def search(query, page: 1)
      query_params = {
        query: query,
        page: page,
        language: @language.code
      }.to_query

      response = @tmdb_api["/search/multi?#{query_params}"].get

      tmdb_results = JSON.parse(response.body)["results"]

      tmdb_results.each do |tmdb_result|
        case tmdb_result["media_type"]
        when "movie"
          movies_service = MoviesService.new
          movie = movies_service.create_movie(tmdb_result)

          next unless movie.present?

          movies_service.add_genres(tmdb_result["genre_ids"], movie)
        when "tv"
          shows_service = ShowsService.new
          show = shows_service.create_show(tmdb_result)

          next unless show.present?

          shows_service.add_genres(tmdb_result["genre_ids"], show)
          shows_service.get_seasons(tmdb_result["id"])
        end
      end
    end
  end
end
