class Page < ActiveRecord::Base
  attr_accessible :content, :name, :permalink, :icon, :position
  validates_uniqueness_of :permalink


end
