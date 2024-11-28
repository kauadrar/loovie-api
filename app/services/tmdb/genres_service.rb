module Tmdb
  class GenresService < TmdbService
    def get_all_genres
      tmdb_movies_genres_response = @tmdb_api["/genre/movie/list?language=#{@language.code}"].get

      tmdb_movies_genres = JSON.parse(tmdb_movies_genres_response.body)["genres"]

      tmdb_shows_genres_response = @tmdb_api["/genre/tv/list?language=#{@language.code}"].get

      tmdb_shows_genres = JSON.parse(tmdb_shows_genres_response.body)["genres"]

      all_genres = tmdb_movies_genres + tmdb_shows_genres

      all_genres.each do |tmdb_genre|
        next if Genre.exists?(tmdb_id: tmdb_genre["id"])

        genre = Genre.create(tmdb_id: tmdb_genre["id"])

        GenreTranslation.create(
          genre: genre,
          language: @language,
          name: tmdb_genre["name"],
        )
      end
    end
  end
end
