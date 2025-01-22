module Tmdb
  class TmdbService
    def initialize(language_code = "pt-BR", language_name = "Português (Brasil)")
      @tmdb_api = RestClient::Resource.new("https://api.themoviedb.org/3", headers: {
        accept: "application/json",
        authorization: "Bearer #{ENV['TMDB_API_KEY']}"
      })
      @language = Language.find_or_create_by(code: language_code, name: language_name)
    end
  end
end
