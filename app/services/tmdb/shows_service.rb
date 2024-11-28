module Tmdb
  class ShowsService < TmdbService
    def discover_shows
      response = @tmdb_api["/discover/tv?language=#{@language.code}"].get

      tmdb_shows = JSON.parse(response.body)["results"]

      tmdb_shows.each do |tmdb_show|
        tmdb_id = tmdb_show["id"]

        next if Show.exists?(tmdb_id: tmdb_id)

        show = Show.create(
          tmdb_id:,
          original_name: tmdb_show["original_name"],
          original_language: tmdb_show["original_language"],
          backdrop_path: tmdb_show["backdrop_path"],
          release_date: Date.parse(tmdb_show["first_air_date"]),
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
  end
end
