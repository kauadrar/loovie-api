class ChangeIdToUuidInUsers < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :id
    add_column :users, :id, :uuid, default: 'gen_random_uuid()', null: false
    execute 'ALTER TABLE users ADD PRIMARY KEY (id);'
  end
end
