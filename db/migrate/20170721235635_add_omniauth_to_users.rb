class AddOmniauthToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :name, :string
    add_column :users, :location, :string
    add_column :users, :description, :string
    add_column :users, :company, :string
    add_column :users, :image, :text
    add_column :users, :job_title, :string
    add_column :users, :job_location, :string
    add_column :users, :urls, :string
  end
end
