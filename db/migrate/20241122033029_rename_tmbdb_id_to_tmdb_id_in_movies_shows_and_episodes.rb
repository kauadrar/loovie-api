class RenameTmbdbIdToTmdbIdInMoviesShowsAndEpisodes < ActiveRecord::Migration[8.0]
  def change
    rename_column :movies, :tmbdb_id, :tmdb_id
    rename_column :shows, :tmbdb_id, :tmdb_id
    rename_column :episodes, :tmbdb_id, :tmdb_id
  end
end
