class AddTrailerColumnToMovie < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :trailer, :string, default: ""
  end
end
