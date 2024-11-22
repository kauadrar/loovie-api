class CreateShows < ActiveRecord::Migration[8.0]
  def change
    create_table :shows do |t|
      t.string :tmbdb_id
      t.string :original_name
      t.string :original_language
      t.datetime :release_date
      t.float :vote_average
      t.integer :vote_count
      t.string :backdrop_path
      t.float :popularity
      t.boolean :adult

      t.timestamps
    end
  end
end
