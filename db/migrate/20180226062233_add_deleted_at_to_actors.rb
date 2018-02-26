class AddDeletedAtToActors < ActiveRecord::Migration[5.1]
  def change
    add_column :actors, :deleted_at, :datetime
    add_index :actors, :deleted_at
  end
end
