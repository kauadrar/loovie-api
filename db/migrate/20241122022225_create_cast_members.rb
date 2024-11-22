class CreateCastMembers < ActiveRecord::Migration[8.0]
  def change
    create_table :cast_members, id: :uuid do |t|
      t.belongs_to :person, null: false, foreign_key: true, type: :uuid
      t.belongs_to :cast, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
