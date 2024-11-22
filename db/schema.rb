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

ActiveRecord::Schema[8.0].define(version: 2024_11_22_022225) do
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

  create_table "episodes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "tmbdb_id"
    t.string "original_name"
    t.string "original_language"
    t.datetime "release_date"
    t.float "vote_average"
    t.integer "vote_count"
    t.integer "number"
    t.integer "duration"
    t.string "still_path"
    t.uuid "season_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["season_id"], name: "index_episodes_on_season_id"
  end

  create_table "movies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "tmbdb_id"
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

  create_table "seasons", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "number"
    t.string "poster_path"
    t.string "backdrop_path"
    t.uuid "show_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["show_id"], name: "index_seasons_on_show_id"
  end

  create_table "shows", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "tmbdb_id"
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
  add_foreign_key "episodes", "seasons"
  add_foreign_key "seasons", "shows"
end
