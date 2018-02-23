class AddAttributesToMovie < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :director, :string
    add_column :movies, :producer, :string
    add_column :movies, :writer, :string
  end
end
