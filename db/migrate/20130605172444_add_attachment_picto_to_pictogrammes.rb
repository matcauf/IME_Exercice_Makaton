class AddAttachmentPictoToPictogrammes < ActiveRecord::Migration
  def self.up
    change_table :pictogrammes do |t|
      t.attachment :picto
    end
  end

  def self.down
    drop_attached_file :pictogrammes, :picto
  end
end
