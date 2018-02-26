class AddDeletedAtToPosters < ActiveRecord::Migration[5.1]
  def change
    add_column :posters, :deleted_at, :datetime
    add_index :posters, :deleted_at
  end
end
