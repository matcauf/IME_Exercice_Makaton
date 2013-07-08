class LevelPictogramme < ActiveRecord::Base
  has_many :pictogrammes
  attr_accessible :name, :id
end
