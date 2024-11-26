class AddLanguageRefToGenreTranslations < ActiveRecord::Migration[8.0]
  def change
    add_reference :genre_translations, :language, null: false, foreign_key: true, type: :uuid
  end
end
