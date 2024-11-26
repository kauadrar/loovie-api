json.extract! production_translation, :id, :name, :overview, :poster_path, :language_id, :production_id, :production_type, :created_at, :updated_at

json.original_name production_translation.production.original_name
json.original_language production_translation.production.original_language
json.release_date production_translation.production.release_date
json.vote_average production_translation.production.vote_average
json.vote_count production_translation.production.vote_count

if production_translation.production.is_a?(Movie) || production_translation.production.is_a?(Show)
  json.popularity production_translation.production.popularity
  json.adult production_translation.production.adult
  json.backdrop_path production_translation.production.backdrop_path
end

if production_translation.production.is_a?(Movie) || production_translation.production.is_a?(Episode)
  json.duration production_translation.production.duration
end

if production_translation.production.is_a?(Episode)
  json.still_path production_translation.production.still_path
  json.number production_translation.production.number
end

json.url production_translation_url(production_translation, format: :json)
