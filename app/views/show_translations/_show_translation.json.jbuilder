json.extract! show_translation, :id, :name, :overview, :poster_path, :language_id, :show_id, :created_at, :updated_at

json.popularity show_translation.show.popularity
json.adult show_translation.show.adult
json.backdrop_path show_translation.show.backdrop_path

json.url show_translation_url(show_translation, format: :json)
