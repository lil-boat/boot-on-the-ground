class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.attachment :image
      t.string :url
      t.integer :project_seed_pic
      t.timestamps
    end
  end
end
