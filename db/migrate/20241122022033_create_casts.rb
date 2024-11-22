class CreateCasts < ActiveRecord::Migration[8.0]
  def change
    create_table :casts, id: :uuid do |t|
      t.references :production, polymorphic: true, null: false

      t.timestamps
    end
  end
end
