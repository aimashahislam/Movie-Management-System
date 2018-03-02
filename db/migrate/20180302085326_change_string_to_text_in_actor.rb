class ChangeStringToTextInActor < ActiveRecord::Migration[5.1]
  def change
      change_column :actors, :bio, :text
  end
end
