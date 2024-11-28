class RemoveBackdropPathFromSeasons < ActiveRecord::Migration[8.0]
  def change
    remove_column :seasons, :backdrop_path, :string
  end
end
