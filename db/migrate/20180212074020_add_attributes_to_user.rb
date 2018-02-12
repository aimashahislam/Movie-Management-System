class AddAttributesToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :phone_no, :string
    add_column :users, :gender, :string, null: false
    add_column :users, :status, :string
    add_column :users, :date_of_birth, :datetime, null: false
  end
end
