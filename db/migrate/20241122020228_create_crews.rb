class CreateCrews < ActiveRecord::Migration[8.0]
  def change
    create_table :crews, id: :uuid do |t|
      t.references :production, polymorphic: true, null: false

      t.timestamps
    end
  end
end
