class CreateGenreTranslations < ActiveRecord::Migration[8.0]
  def change
    create_table :genre_translations, id: :uuid do |t|
      t.string :name
      t.belongs_to :genre, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
