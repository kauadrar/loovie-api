class CreateGenres < ActiveRecord::Migration[8.0]
  def change
    create_table :genres, id: :uuid do |t|
      t.string :tmdb_id
      t.references :title, polymorphic: true, null: false, type: :uuid

      t.timestamps
    end
  end
end
