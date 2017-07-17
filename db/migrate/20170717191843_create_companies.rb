class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.attachment :logo
      t.string :url 
      t.timestamps
    end
  end
end
