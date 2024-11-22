class CreateSeasonTranslations < ActiveRecord::Migration[8.0]
  def change
    create_table :season_translations, id: :uuid do |t|
      t.string :overview

      t.timestamps
    end
  end
end
