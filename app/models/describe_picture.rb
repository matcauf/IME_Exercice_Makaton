class DescribePicture < ActiveRecord::Base
  
  has_many :describisations, dependent: :destroy, :order => "position"
  has_many :pictogrammes, through: :describisations, :order => "position"
  
  attr_accessible :describe_image,:remote_describe_image_url, :describe_pictures_pictogrammes,:pictogramme_tokens
  
  
  
  has_attached_file :describe_image, :styles => { :small => ["305x305>", :png ],:thumb => ["105x105>", :png ]},
                    :url => "/Upload/description_photo/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/Upload/description_photo/:id/:style/:basename.:extension"
 
  
  validates_attachment_presence :describe_image
  validates_attachment_content_type :describe_image, :content_type =>  /^image\/(png|gif|jpeg)/
  
  
  attr_reader :pictogramme_tokens
  
  
   
 before_save :set_position
  before_create :set_position
  
 validate :validate_order, :message => "can't be empty"
  def pictogramme_tokens=(ids)
    @entries = ids
    self.pictogramme_ids = ids.split(",")
  end
  
  private
  def set_position
    hash = Hash[@entries.split(",").map.with_index.to_a]
    self.describisations.each do |describisation|
      describisation.position =  hash[describisation.pictogramme.id.to_s]   
    end  
  end
  
  def validate_order
  
    
    if self.pictogramme_ids.length != 3
       errors.add(:nombre_elements_phrase, 'Veuillez entrer 3 elements')
   elsif Pictogramme.find(self.pictogramme_ids[0]).grammar_pictogramme.name != "nom"
    errors.add(:position_1, 'Verifiez la phrase (nom,verbe,nom) ou le pictogramme ' + Pictogramme.find(self.pictogramme_ids[0]).name + ' de type ' + Pictogramme.find(self.pictogramme_ids[0]).grammar_pictogramme.name + ' soit un nom' )
    elsif Pictogramme.find(self.pictogramme_ids[1]).grammar_pictogramme.name != "verbe"
      errors.add(:position_2, 'Verifiez la phrase (nom,verbe,nom) ou le pictogramme ' + Pictogramme.find(self.pictogramme_ids[1]).name + ' de type ' + Pictogramme.find(self.pictogramme_ids[1]).grammar_pictogramme.name + ' soit un verbe' )
     elsif Pictogramme.find(self.pictogramme_ids[2]).grammar_pictogramme.name != "nom"
    errors.add(:position_1, 'Verifiez la phrase (nom,verbe,nom) ou le pictogramme ' + Pictogramme.find(self.pictogramme_ids[2]).name + ' de type ' + Pictogramme.find(self.pictogramme_ids[2]).grammar_pictogramme.name + ' soit un nom' )
    end
    
  end
 
end