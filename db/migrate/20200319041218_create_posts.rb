class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.string :img
      t.references :user, foregn_key: true, null: false

      t.timestamps
    end
  end
end
