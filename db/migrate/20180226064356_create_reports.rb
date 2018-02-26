class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.string :statement
      t.references :review, foreign_key: true
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :reports, :deleted_at
  end
end
