class ChangeIdToUuidInMoviesAndShows < ActiveRecord::Migration[8.0]
  def change
    remove_column :movies, :id
    add_column :movies, :id, :uuid, default: 'gen_random_uuid()', null: false
    execute 'ALTER TABLE movies ADD PRIMARY KEY (id);'

    remove_column :shows, :id
    add_column :shows, :id, :uuid, default: 'gen_random_uuid()', null: false
    execute 'ALTER TABLE shows ADD PRIMARY KEY (id);'
  end
end
