class ChangeStringToTextInMovie < ActiveRecord::Migration[5.1]
  def change
    change_column :movies, :description, :text
  end
end
