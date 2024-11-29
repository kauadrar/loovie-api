class CreateEpisodeTranslations < ActiveRecord::Migration[8.0]
  def change
    create_table :episode_translations, id: :uuid do |t|
      t.string :name
      t.text :overview
      t.belongs_to :episode, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
