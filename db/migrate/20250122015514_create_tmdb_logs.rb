class CreateTmdbLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :tmdb_logs, id: :uuid do |t|
      t.string :action
      t.integer :last_page_fetched
      t.references :entity, polymorphic: true, null: true, type: :uuid

      t.timestamps
    end
  end
end
