class User < ActiveRecord::Base
  rolify
  scope :admins, with_role(:admin)
  scope :utilisateurs, with_role(:user)
  scope :enseignants, with_role(:teacher)
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable


  has_many :user_stats, dependent: :destroy
  has_many :galleries, through: :user_stats, :order => "Pictogramme.name"
  # Setup accessible (or protected) attributes for your model
  attr_protected :role_ids, :as => :admin
  attr_accessible :username,:email, :password, :password_confirmation, :remember_me, :last
  
  validates_presence_of :username
  validates_presence_of :password
  validates_uniqueness_of :username, :case_sensitive => false
  
  before_create :assign_role
  before_create :set_default_values
  
 def pictures_exercices_stats_to_json category_name, gallery_name, type
 [
    {
  "key" => "exercice-" + gallery_name + "-" + type,
  "values" => found_stats_exercice(category_name,gallery_name,type).map do |exercice|
    
 {
   "label" => exercice[0],
   "value" => exercice[1]
 }
  end   
  }
]
  end
  
 def pictures_galleries_stats_to_json category_name, type
 [
    {
  "key" => "gallerie-" + category_name + "-" + type,
  "values" => found_stats_subcategory(category_name, type).map do |gallery|
    
 {
   "label" => gallery[0],
   "value" => gallery [1]
 }
  end   
  }
]
  end
  
  def pictures_categories_stats_to_json type
 [
    {
  "key" => "global-" + type,
  "values" => Category.order("name").map do |category|
    
 {
   "label" => category.name,
   "value" => found_stats_category(category,type)
 }
  end   
  }
]
  end
  
 
  
  
  private 
  def assign_role
    # assign a default role if no role is assigned
    self.add_role :user if self.roles.first.nil?
  end
  
  def set_default_values
    Gallery.all.each do |gallery|
      self.galleries << gallery
    end
  end
  
  def found_stats_category category, type
    i = 0
    i_update = 0
    active_gallery = 0
    if type == "two_pictures"
    category.galleries.each do |gallery|
    i += gallery.user_stats.find_by_user_id(self.id).two_pictures_average
    #calculate the average where user has at least one good response
    if i !=  i_update
      i_update = i
      active_gallery +=1
    end
    
    end
    elsif type == "three_pictures"
      category.galleries.each do |gallery|
    i += gallery.user_stats.find_by_user_id(self.id).three_pictures_average
    if i !=  i_update
      i_update = i
      active_gallery +=1
    end
    end
    
    #calculate the average where user has at least one good response
   
    end
    return i/(active_gallery.nonzero? || 1)
  end
  
  def found_stats_subcategory category_name, type
        i = []
         if type == "two_pictures"
        Category.find_by_name(category_name).galleries.joins(:pictogramme).order("pictogrammes.name").each do |gallery|
          i << [gallery.pictogramme.name,gallery.user_stats.find_by_user_id(self.id).two_pictures_average]          
        end
         elsif type == "three_pictures"
           Category.find_by_name(category_name).galleries.joins(:pictogramme).order("pictogrammes.name").each do |gallery|
          i << [gallery.pictogramme.name,gallery.user_stats.find_by_user_id(self.id).three_pictures_average]          
        end
        end
        return i
  end
  
  def found_stats_exercice  category_name, gallery_name ,type
       #keep category name in case of update
       stats = Pictogramme.find_by_name(gallery_name).gallery.user_stats.find_by_user_id(self.id)
      
         if type == "two_pictures"
       stats.two_detailled_stats       
         elsif type == "three_pictures"
        stats.three_detailled_stats      
        end
  end
  
  
end
