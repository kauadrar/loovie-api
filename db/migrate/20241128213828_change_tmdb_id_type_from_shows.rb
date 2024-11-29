class ChangeTmdbIdTypeFromShows < ActiveRecord::Migration[8.0]
  def change
    remove_column :shows, :tmdb_id, :string
    add_column :shows, :tmdb_id, :bigint
  end
end
