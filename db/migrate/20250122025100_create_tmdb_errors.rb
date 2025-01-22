class CreateTmdbErrors < ActiveRecord::Migration[8.0]
  def change
    create_table :tmdb_errors, id: :uuid do |t|
      t.string :class_name
      t.string :message
      t.text :backtrace
      t.text :body
      t.belongs_to :tmdb_log, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
