class AddBirthdayToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :birthday, :datetime, null: false
  end
end
