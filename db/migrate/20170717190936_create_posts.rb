class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.string :category, null: false
      t.integer :user_id
      t.integer :likes_id
      t.timestamps
    end
  end
end
