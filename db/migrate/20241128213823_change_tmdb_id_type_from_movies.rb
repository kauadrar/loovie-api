class ChangeTmdbIdTypeFromMovies < ActiveRecord::Migration[8.0]
  def change
    remove_column :movies, :tmdb_id, :string
    add_column :movies, :tmdb_id, :bigint
  end
end
