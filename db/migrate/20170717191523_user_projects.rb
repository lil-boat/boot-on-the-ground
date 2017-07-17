class UserProjects < ActiveRecord::Migration[5.1]
  def change
    t.integer :user_id, null: false
    t.integer :project_id, null: false
    t.timestamps
  end
end
