class DiscoverShowsJob < TmdbBaseJob
  def perform(sort_by = "vote_count")
    shows_service = Tmdb::ShowsService.new

    @tmdb_log = TmdbLog.find_or_create_by!(entity_type: "Show", action: "discover_shows_by_#{sort_by}")

    last_page_fetched = @tmdb_log.last_page_fetched || 0

    page = last_page_fetched + 1

    shows_service.discover_shows(page:, sort_by:)

    @tmdb_log.update!(last_page_fetched: page)
  end
end
