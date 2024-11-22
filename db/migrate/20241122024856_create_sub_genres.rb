class CreateSubGenres < ActiveRecord::Migration[8.0]
  def change
    create_table :sub_genres, id: :uuid do |t|
      t.references :title, polymorphic: true, null: false, type: :uuid

      t.timestamps
    end
  end
end
