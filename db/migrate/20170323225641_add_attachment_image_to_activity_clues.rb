class AddAttachmentImageToActivityClues < ActiveRecord::Migration
  def self.up
    change_table :activity_instances do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :activity_instances, :image
  end
end
