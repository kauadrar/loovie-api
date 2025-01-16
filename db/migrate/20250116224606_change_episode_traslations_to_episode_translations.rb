class ChangeEpisodeTraslationsToEpisodeTranslations < ActiveRecord::Migration[8.0]
  def change
    rename_table :episode_traslations, :episode_translations
  end
end
