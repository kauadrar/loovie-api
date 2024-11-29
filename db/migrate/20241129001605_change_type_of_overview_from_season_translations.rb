class ChangeTypeOfOverviewFromSeasonTranslations < ActiveRecord::Migration[8.0]
  def change
    remove_column :season_translations, :overview, :string
    add_column :season_translations, :overview, :text
  end
end
