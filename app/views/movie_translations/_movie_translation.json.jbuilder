json.id movie_translation.movie_id
json.translation_id movie_translation.id

json.extract! movie_translation, :name, :overview, :poster_path, :adult, :popularity, :vote_average, :vote_count, :adult, :language_code, :created_at, :updated_at
