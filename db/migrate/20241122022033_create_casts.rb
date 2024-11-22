class CreateCasts < ActiveRecord::Migration[8.0]
  def change
    create_table :casts, id: :uuid do |t|
      t.belongs_to :production, polymorhic: true, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
