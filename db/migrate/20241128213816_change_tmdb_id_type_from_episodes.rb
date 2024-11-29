class ChangeTmdbIdTypeFromEpisodes < ActiveRecord::Migration[8.0]
  def change
    remove_column :episodes, :tmdb_id, :string
    add_column :episodes, :tmdb_id, :bigint
  end
end
