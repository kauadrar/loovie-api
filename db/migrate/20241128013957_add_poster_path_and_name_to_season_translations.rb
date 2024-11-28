class AddPosterPathAndNameToSeasonTranslations < ActiveRecord::Migration[8.0]
  def change
    add_column :season_translations, :poster_path, :string
    add_column :season_translations, :name, :string
  end
end
