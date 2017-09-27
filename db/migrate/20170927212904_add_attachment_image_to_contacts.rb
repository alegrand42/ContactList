class AddAttachmentImageToContacts < ActiveRecord::Migration[4.2]
  def self.up
    change_table :contacts do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :contacts, :image
  end
end
