class AddDeltaToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :delta, :boolean, null: false, default: true
  end
end
