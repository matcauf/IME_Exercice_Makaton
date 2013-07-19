class Page < ActiveRecord::Base
  attr_accessible :content, :name, :permalink, :icon, :position
  validates_uniqueness_of :permalink
  validates_presence_of :name
  validates_presence_of :permalink
  validates_presence_of :content


end
