class AddAttachmentDescribeimageToDescribePictures < ActiveRecord::Migration
  def self.up
    change_table :describe_pictures do |t|
      t.attachment :describe_image
    end
  end

  def self.down
    drop_attached_file :describe_pictures, :describe_image
  end
end
