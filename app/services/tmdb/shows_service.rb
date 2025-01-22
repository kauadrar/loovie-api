module Tmdb
  class ShowsService < TmdbService
    def discover_shows(page: 1, sort_by: "vote_count", sort_order: "desc")
      query_params = {
        language: @language.code,
        sort_by: "#{sort_by}.#{sort_order}",
        page:
      }.to_query

      response = @tmdb_api["/discover/tv?#{query_params}"].get

      tmdb_shows = JSON.parse(response.body)["results"]

      tmdb_shows.each do |tmdb_show|
        tmdb_id = tmdb_show["id"]

        next if Show.exists?(tmdb_id: tmdb_id)

        show = Show.create(
          tmdb_id:,
          original_name: tmdb_show["original_name"],
          original_language: tmdb_show["original_language"],
          backdrop_path: tmdb_show["backdrop_path"],
          release_date: tmdb_show["first_air_date"] ? Date.parse(tmdb_show["first_air_date"]) : nil,
          vote_average: tmdb_show["vote_average"],
          vote_count: tmdb_show["vote_count"],
          popularity: tmdb_show["popularity"],
        )

        ShowTranslation.create(
          show:,
          language: @language,
          name: tmdb_show["name"],
          poster_path: tmdb_show["poster_path"],
          overview: tmdb_show["overview"],
        )

        genre_ids = tmdb_show["genre_ids"]

        genre_ids.each do |genre_id|
          genre = Genre.find_by(tmdb_id: genre_id)

          next unless genre

          TitleGenre.create(
            genre: genre,
            title: show,
          )
        end
      end
    end

    def get_seasons(tmdb_id)
      query_params = {
        language: @language.code
      }.to_query

      response = @tmdb_api["/tv/#{tmdb_id}?#{query_params}"].get
      tmdb_show = JSON.parse(response.body)

      show = Show.find_by(tmdb_id: tmdb_id)

      tmdb_seasons = tmdb_show["seasons"]
      tmdb_seasons.each do |tmdb_season|
        next if Season.exists?(tmdb_id: tmdb_season["id"])

        season = Season.create(
          show: show,
          tmdb_id: tmdb_season["id"],
          number: tmdb_season["season_number"],
          release_date: tmdb_season["air_date"] ? Date.parse(tmdb_season["air_date"]) : nil,
          vote_average: tmdb_season["vote_average"],
        )

        SeasonTranslation.create(
          season: season,
          language: @language,
          name: tmdb_season["name"],
          overview: tmdb_season["overview"],
          poster_path: tmdb_season["poster_path"],
        )
      end
    end
  end
end
