class CreatePosters < ActiveRecord::Migration[5.1]
  def change
    create_table :posters do |t|
      t.references :movie, foreign_key: true

      t.timestamps
    end
  end
end
