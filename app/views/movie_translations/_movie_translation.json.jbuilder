json.extract! movie_translation, :id, :name, :overview, :poster_path, :language_id, :movie_id, :created_at, :updated_at

json.popularity movie_translation.movie.popularity
json.adult movie_translation.movie.adult
json.backdrop_path movie_translation.movie.backdrop_path
json.duration movie_translation.movie.duration

json.url movie_translation_url(movie_translation, format: :json)
