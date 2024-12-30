class CreatePostTags < ActiveRecord::Migration[8.0]
  def change
    create_table :post_tags, id: :uuid do |t|
      t.references :post, null: false, foreign_key: true, type: :uuid
      t.references :tag, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
