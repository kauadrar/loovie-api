class CreateNormalPosts < ActiveRecord::Migration[8.0]
  def change
    create_table :normal_posts, id: :uuid do |t|
      t.references :post, null: false, foreign_key: true, type: :uuid
      t.text :text

      t.timestamps
    end
  end
end
