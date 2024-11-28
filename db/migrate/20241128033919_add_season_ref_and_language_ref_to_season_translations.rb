class AddSeasonRefAndLanguageRefToSeasonTranslations < ActiveRecord::Migration[8.0]
  def change
    add_belongs_to :season_translations, :season, null: false, foreign_key: true, type: :uuid
    add_belongs_to :season_translations, :language, null: false, foreign_key: true, type: :uuid
  end
end
