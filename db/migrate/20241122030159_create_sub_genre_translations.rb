class CreateSubGenreTranslations < ActiveRecord::Migration[8.0]
  def change
    create_table :sub_genre_translations, id: :uuid do |t|
      t.string :name
      t.belongs_to :sub_genre, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
