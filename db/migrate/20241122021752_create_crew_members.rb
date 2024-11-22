class CreateCrewMembers < ActiveRecord::Migration[8.0]
  def change
    create_table :crew_members, id: :uuid do |t|
      t.belongs_to :person, null: false, foreign_key: true, type: :uuid
      t.belongs_to :crew, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
