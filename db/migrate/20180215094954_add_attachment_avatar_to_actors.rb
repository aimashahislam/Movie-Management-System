class AddAttachmentAvatarToActors < ActiveRecord::Migration[5.1]
  def self.up
    change_table :actors do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :actors, :avatar
  end
end
