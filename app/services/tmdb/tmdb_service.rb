module Tmdb
  class TmdbService
    def initialize(language_code = "pt-BR", language_name = "Português (Brasil)")
      @tmdb_api = RestClient::Resource.new("https://api.themoviedb.org/3", headers: {
        accept: "application/json",
        authorization: "Bearer #{ENV['TMDB_API_KEY']}"
      })
      @language = Language.find_or_create_by(code: language_code, name: language_name)
    end

    def add_genres(genre_ids, title)
      genre_ids.each do |genre_id|
        genre = Genre.find_by(tmdb_id: genre_id)

        next unless genre

        TitleGenre.create(
          genre: genre,
          title: title,
        )
      end
    end
  end
end
