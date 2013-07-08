class Gallery < ActiveRecord::Base
    belongs_to :category
    belongs_to :pictogramme
    has_many :pictures, dependent: :destroy
    has_many :image_types, through: :pictures
    has_many :user_stats, dependent: :destroy
    has_many :users, through: :user_stats
    
    
    
     attr_accessible :category_id ,:pictogramme_id
     validates :category_id, :presence => true
     validates :pictogramme_id, :presence => true
     validates_uniqueness_of :pictogramme_id, :case_sensitive => false
      
  before_create :set_default_association
  
  
  
  
    
    
  
  private
  def set_default_association
    User.all.each do |user|
      self.users << user
    end
  end
end
