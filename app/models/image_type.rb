class ImageType < ActiveRecord::Base
  
  has_many :pictures
  attr_accessible :name
  
   validates_presence_of :name
  validates_uniqueness_of :name, :case_sensitive => false
  
end
