json.extract! person, :id, :name, :main_profession, :birthday, :deathday, :bio, :profile_picture_path, :created_at, :updated_at
json.url person_url(person, format: :json)
