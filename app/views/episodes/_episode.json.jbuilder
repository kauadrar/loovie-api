json.extract! episode, :id, :tmbdb_id, :original_name, :original_language, :release_date, :vote_average, :vote_count, :number, :duration, :still_path, :season_id, :created_at, :updated_at
json.url episode_url(episode, format: :json)
