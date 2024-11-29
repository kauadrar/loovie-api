# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2024_11_29_001816) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "cast_members", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "person_id", null: false
    t.uuid "cast_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cast_id"], name: "index_cast_members_on_cast_id"
    t.index ["person_id"], name: "index_cast_members_on_person_id"
  end

  create_table "casts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "production_type", null: false
    t.bigint "production_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["production_type", "production_id"], name: "index_casts_on_production"
  end

  create_table "crew_members", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "person_id", null: false
    t.uuid "crew_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crew_id"], name: "index_crew_members_on_crew_id"
    t.index ["person_id"], name: "index_crew_members_on_person_id"
  end

  create_table "crews", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "production_type", null: false
    t.bigint "production_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["production_type", "production_id"], name: "index_crews_on_production"
  end

  create_table "episode_traslations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.text "overview"
    t.uuid "episode_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["episode_id"], name: "index_episode_traslations_on_episode_id"
  end

  create_table "episodes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "release_date"
    t.float "vote_average"
    t.integer "vote_count"
    t.integer "number"
    t.integer "duration"
    t.string "still_path"
    t.uuid "season_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tmdb_id"
    t.index ["season_id"], name: "index_episodes_on_season_id"
  end

  create_table "genre_sub_genres", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "genre_id", null: false
    t.uuid "sub_genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_genre_sub_genres_on_genre_id"
    t.index ["sub_genre_id"], name: "index_genre_sub_genres_on_sub_genre_id"
  end

  create_table "genre_translations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "language_id", null: false
    t.index ["genre_id"], name: "index_genre_translations_on_genre_id"
    t.index ["language_id"], name: "index_genre_translations_on_language_id"
  end

  create_table "genres", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tmdb_id"
  end

  create_table "languages", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movie_translations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.text "overview"
    t.string "poster_path"
    t.uuid "language_id", null: false
    t.uuid "movie_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_movie_translations_on_language_id"
    t.index ["movie_id"], name: "index_movie_translations_on_movie_id"
  end

  create_table "movies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "original_name"
    t.string "original_language"
    t.datetime "release_date"
    t.float "vote_average"
    t.integer "vote_count"
    t.string "backdrop_path"
    t.float "popularity"
    t.boolean "adult"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tmdb_id"
  end

  create_table "people", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "main_profession"
    t.string "birthday"
    t.string "deathday"
    t.string "bio"
    t.string "profile_picture_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "season_translations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "poster_path"
    t.string "name"
    t.uuid "season_id", null: false
    t.uuid "language_id", null: false
    t.text "overview"
    t.index ["language_id"], name: "index_season_translations_on_language_id"
    t.index ["season_id"], name: "index_season_translations_on_season_id"
  end

  create_table "seasons", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "number"
    t.uuid "show_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "release_date"
    t.integer "tmdb_id"
    t.float "vote_average"
    t.index ["show_id"], name: "index_seasons_on_show_id"
  end

  create_table "show_translations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.text "overview"
    t.string "poster_path"
    t.uuid "language_id", null: false
    t.uuid "show_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_show_translations_on_language_id"
    t.index ["show_id"], name: "index_show_translations_on_show_id"
  end

  create_table "shows", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "original_name"
    t.string "original_language"
    t.datetime "release_date"
    t.float "vote_average"
    t.integer "vote_count"
    t.string "backdrop_path"
    t.float "popularity"
    t.boolean "adult"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tmdb_id"
  end

  create_table "sub_genre_translations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "sub_genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "language_id", null: false
    t.index ["language_id"], name: "index_sub_genre_translations_on_language_id"
    t.index ["sub_genre_id"], name: "index_sub_genre_translations_on_sub_genre_id"
  end

  create_table "sub_genres", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "title_genres", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title_type", null: false
    t.uuid "title_id", null: false
    t.uuid "genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_title_genres_on_genre_id"
    t.index ["title_type", "title_id"], name: "index_title_genres_on_title"
  end

  create_table "title_sub_genres", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title_type", null: false
    t.uuid "title_id", null: false
    t.uuid "sub_genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_genre_id"], name: "index_title_sub_genres_on_sub_genre_id"
    t.index ["title_type", "title_id"], name: "index_title_sub_genres_on_title"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti"
    t.string "username"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.datetime "birthday", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "cast_members", "casts"
  add_foreign_key "cast_members", "people"
  add_foreign_key "crew_members", "crews"
  add_foreign_key "crew_members", "people"
  add_foreign_key "episode_traslations", "episodes"
  add_foreign_key "episodes", "seasons"
  add_foreign_key "genre_sub_genres", "genres"
  add_foreign_key "genre_sub_genres", "sub_genres"
  add_foreign_key "genre_translations", "genres"
  add_foreign_key "genre_translations", "languages"
  add_foreign_key "movie_translations", "languages"
  add_foreign_key "movie_translations", "movies"
  add_foreign_key "season_translations", "languages"
  add_foreign_key "season_translations", "seasons"
  add_foreign_key "seasons", "shows"
  add_foreign_key "show_translations", "languages"
  add_foreign_key "show_translations", "shows"
  add_foreign_key "sub_genre_translations", "languages"
  add_foreign_key "sub_genre_translations", "sub_genres"
  add_foreign_key "title_genres", "genres"
  add_foreign_key "title_sub_genres", "sub_genres"
end
