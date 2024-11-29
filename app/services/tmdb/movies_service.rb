module Tmdb
  class MoviesService < TmdbService
    def discover_movies
      response = @tmdb_api["/discover/movie?language=#{@language.code}&sort_by=vote_count.desc"].get

      tmdb_movies = JSON.parse(response.body)["results"]

      tmdb_movies.each do |tmdb_movie|
        tmdb_id = tmdb_movie["id"]

        next if Movie.exists?(tmdb_id: tmdb_id)

        movie = Movie.create(
          tmdb_id:,
          original_name: tmdb_movie["original_title"],
          original_language: tmdb_movie["original_language"],
          backdrop_path: tmdb_movie["backdrop_path"],
          release_date: Date.parse(tmdb_movie["release_date"]),
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

        genre_ids = tmdb_movie["genre_ids"]

        genre_ids.each do |genre_id|
          genre = Genre.find_by(tmdb_id: genre_id)

          next unless genre

          TitleGenre.create(
            genre: genre,
            title: movie,
          )
        end
      end
    end
  end
end
