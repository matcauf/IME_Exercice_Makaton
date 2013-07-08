class Describisation < ActiveRecord::Base
  belongs_to :describe_picture, dependent: :destroy
  belongs_to :pictogramme
  attr_accessible :position, :pictogramme
end
