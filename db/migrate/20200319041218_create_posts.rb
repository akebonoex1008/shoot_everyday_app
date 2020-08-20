class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title,    default: ""
      t.string :text,     default: ""
      t.string :img,      null: false, default: ""
      t.references :user, foregn_key: true, null: false

      t.timestamps
    end
  end
end
