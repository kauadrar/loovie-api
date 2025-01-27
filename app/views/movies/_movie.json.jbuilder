json.extract! movie, :id, :tmdb_id, :original_name, :original_language, :release_date, :vote_average, :vote_count, :backdrop_path, :popularity, :adult, :duration, :created_at, :updated_at
json.url movie_url(movie, format: :json)
