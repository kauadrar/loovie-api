class CreateTitleSubGenres < ActiveRecord::Migration[8.0]
  def change
    create_table :title_sub_genres, id: :uuid do |t|
      t.references :title, polymorphic: true, null: false, type: :uuid
      t.belongs_to :sub_genre, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
