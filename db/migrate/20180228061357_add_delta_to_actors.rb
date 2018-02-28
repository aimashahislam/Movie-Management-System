class AddDeltaToActors < ActiveRecord::Migration[5.1]
  def change
    add_column :actors, :delta, :boolean, null: false, default: true
  end
end
