class AddLanguageRefToSubGenreTranslations < ActiveRecord::Migration[8.0]
  def change
    add_reference :sub_genre_translations, :language, null: false, foreign_key: true, type: :uuid
  end
end
