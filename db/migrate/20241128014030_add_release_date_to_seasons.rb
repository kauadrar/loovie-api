class AddReleaseDateToSeasons < ActiveRecord::Migration[8.0]
  def change
    add_column :seasons, :release_date, :datetime
  end
end
