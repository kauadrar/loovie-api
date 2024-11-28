json.extract! movie_translation, :id, :name, :overview, :poster_path, :language_id, :movie_id, :created_at, :updated_at
json.url movie_translation_url(movie_translation, format: :json)
