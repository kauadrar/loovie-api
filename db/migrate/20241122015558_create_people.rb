class CreatePeople < ActiveRecord::Migration[8.0]
  def change
    create_table :people, id: :uuid do |t|
      t.string :name
      t.string :main_profession
      t.string :birthday
      t.string :deathday
      t.string :bio
      t.string :profile_picture_path

      t.timestamps
    end
  end
end
