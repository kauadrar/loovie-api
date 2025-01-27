json.id show_translation.show_id
json.translation_id show_translation.id

json.extract! show_translation, :name, :overview, :poster_path, :adult, :popularity, :vote_average, :vote_count, :adult, :language_code, :created_at, :updated_at
