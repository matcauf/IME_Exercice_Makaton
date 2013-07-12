class Picture < ActiveRecord::Base
  
  belongs_to :gallery
  belongs_to :image_type
  attr_accessible :image, :gallery_id,:image_type_id
  has_attached_file :image, :styles => { :small => ["150x150>", :png ],:thumb => ["105x105>", :png ]},
                    :url => "/Upload/picture/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/Upload/picture/:id/:style/:basename.:extension"
 
  
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type =>  /^image\/(png|gif|jpeg)/
  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
      "name" => read_attribute(:image_file_name),
      "size" => read_attribute(:image_file_size),
      "url" => self.image.url(:original),
      "delete_url" => picture_path(self),
      "delete_type" => "DELETE",
      "thumbnail_url" => image.url(:thumb)
    }
  end
end
