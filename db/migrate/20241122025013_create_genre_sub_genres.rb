class CreateGenreSubGenres < ActiveRecord::Migration[8.0]
  def change
    create_table :genre_sub_genres, id: :uuid do |t|
      t.belongs_to :genre, null: false, foreign_key: true, type: :uuid
      t.belongs_to :sub_genre, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
