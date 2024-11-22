class CreateSeasons < ActiveRecord::Migration[8.0]
  def change
    create_table :seasons, id: :uuid do |t|
      t.integer :number
      t.string :poster_path
      t.string :backdrop_path
      t.belongs_to :show, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
