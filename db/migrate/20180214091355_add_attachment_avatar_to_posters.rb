class AddAttachmentAvatarToPosters < ActiveRecord::Migration[5.1]
  def self.up
    change_table :posters do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :posters, :avatar
  end
end
