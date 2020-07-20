class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :user, foregn_key: true, null: false
      t.references :post, foregn_key: true, null: false

      t.string :content

      t.timestamps
    end
  end
end
