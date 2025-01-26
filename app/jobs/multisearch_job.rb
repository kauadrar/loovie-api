class MultisearchJob < TmdbBaseJob
  def perform(query)
    @tmdb_log = TmdbLog.find_or_create_by!(action: "multisearch")

    Tmdb::MultisearchService.new.search(query)
  end
end
