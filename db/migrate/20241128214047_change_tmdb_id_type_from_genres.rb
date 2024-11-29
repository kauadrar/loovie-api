class ChangeTmdbIdTypeFromGenres < ActiveRecord::Migration[8.0]
  def change
    remove_column :genres, :tmdb_id, :string
    add_column :genres, :tmdb_id, :bigint
  end
end
