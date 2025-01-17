json.id movie_translation.movie_id
json.translation_id movie_translation.id

json.extract! movie_translation, :name, :overview, :poster_path, :language_id, :created_at, :updated_at

json.popularity movie_translation.movie.popularity
json.adult movie_translation.movie.adult
json.backdrop_path movie_translation.movie.backdrop_path
json.duration movie_translation.movie.duration

json.url movie_translation_url(movie_translation, format: :json)
