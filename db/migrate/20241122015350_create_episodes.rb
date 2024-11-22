class CreateEpisodes < ActiveRecord::Migration[8.0]
  def change
    create_table :episodes, id: :uuid do |t|
      t.string :tmbdb_id
      t.string :original_name
      t.string :original_language
      t.datetime :release_date
      t.float :vote_average
      t.integer :vote_count
      t.integer :number
      t.integer :duration
      t.string :still_path
      t.belongs_to :season, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
