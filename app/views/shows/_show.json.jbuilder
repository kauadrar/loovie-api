json.extract! show, :id, :tmdb_id, :original_name, :original_language, :release_date, :vote_average, :vote_count, :backdrop_path, :popularity, :adult, :created_at, :updated_at
json.url show_url(show, format: :json)
