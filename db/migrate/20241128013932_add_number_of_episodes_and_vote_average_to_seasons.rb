class AddNumberOfEpisodesAndVoteAverageToSeasons < ActiveRecord::Migration[8.0]
  def change
    add_column :seasons, :number_of_episodes, :integer
    add_column :seasons, :vote_average, :float
  end
end
