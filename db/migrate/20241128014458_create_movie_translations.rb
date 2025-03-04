class CreateMovieTranslations < ActiveRecord::Migration[8.0]
  def change
    create_table :movie_translations, id: :uuid do |t|
      t.string :name
      t.text :overview
      t.string :poster_path
      t.belongs_to :language, null: false, foreign_key: true, type: :uuid
      t.belongs_to :movie, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
