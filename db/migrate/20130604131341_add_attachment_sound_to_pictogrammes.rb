class AddAttachmentSoundToPictogrammes < ActiveRecord::Migration
  def self.up
    change_table :pictogrammes do |t|
      t.attachment :sound
    end
  end

  def self.down
    drop_attached_file :pictogrammes, :sound
  end
end
