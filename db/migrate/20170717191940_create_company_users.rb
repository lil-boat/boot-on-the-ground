class CreateCompanyUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :company_users do |t|
      t.integer :company_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
