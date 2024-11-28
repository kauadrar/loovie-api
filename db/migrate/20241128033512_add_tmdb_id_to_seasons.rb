class AddTmdbIdToSeasons < ActiveRecord::Migration[8.0]
  def change
    add_column :seasons, :tmdb_id, :integer
  end
end
