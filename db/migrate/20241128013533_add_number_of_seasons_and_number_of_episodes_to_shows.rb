class AddNumberOfSeasonsAndNumberOfEpisodesToShows < ActiveRecord::Migration[8.0]
  def change
    add_column :shows, :number_of_seasons, :integer
    add_column :shows, :number_of_episodes, :integer
  end
end
