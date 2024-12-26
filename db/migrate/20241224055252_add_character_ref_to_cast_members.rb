class AddCharacterRefToCastMembers < ActiveRecord::Migration[8.0]
  def change
    add_reference :cast_members, :character, null: false, foreign_key: true, type: :uuid
  end
end
