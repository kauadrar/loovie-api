class RemoveTitleFromSubGenres < ActiveRecord::Migration[8.0]
  def change
    remove_reference :sub_genres, :title, polymorphic: true, null: false, type: :uuid
  end
end
