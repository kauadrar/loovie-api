class DropProductionTranslations < ActiveRecord::Migration[8.0]
  def change
    drop_table :production_translations, id: :uuid do |t|
      t.string :name
      t.string :overview
      t.string :poster_path
      t.belongs_to :language, null: false, foreign_key: true, type: :uuid
      t.references :production, polymorphic: true, null: false, type: :uuid

      t.timestamps
    end
  end
end
