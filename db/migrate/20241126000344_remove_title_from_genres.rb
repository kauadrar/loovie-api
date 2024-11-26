class RemoveTitleFromGenres < ActiveRecord::Migration[8.0]
  def change
    remove_reference :genres, :title, polymorphic: true, null: false, type: :uuid
  end
end
