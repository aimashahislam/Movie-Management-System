class CreateActors < ActiveRecord::Migration[5.1]
  def change
    create_table :actors do |t|
      t.string :name
      t.string :bio
      t.date :date_of_birth

      t.timestamps
    end
  end
end
