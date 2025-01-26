class DiscoverMoviesJob < TmdbBaseJob
  def perform(sort_by = "vote_count")
    movies_service = Tmdb::MoviesService.new

    @tmdb_log = TmdbLog.find_or_create_by!(entity_type: "Movie", action: "discover_movies_by_#{sort_by}")

    last_page_fetched = @tmdb_log.last_page_fetched || 0

    page = last_page_fetched + 1

    movies_service.discover_movies(page:, sort_by:)

    @tmdb_log.update!(last_page_fetched: page)
  end
end
