class Pictogramme < ActiveRecord::Base
  has_one :gallery, dependent: :destroy 
  has_one :level_pictogramme
  has_many :describisations, dependent: :destroy
  has_many :describe_pictures, through: :describisations
  
  belongs_to :level_pictogramme
  belongs_to :grammar_pictogramme
  
  
  has_attached_file :picto, :styles => { :small => ["150x150>", :png ],:thumb => ["105x105>", :png ]},
                    :url => "/Upload/pictogramme/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/Upload/pictogramme/:id/:style/:basename.:extension"
  
  has_attached_file :sound,:styles => { :ogg => ['ogg', :ogg] }, :processors => [:ogg],
                    :url => "/Upload/pictogramme_sound/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/Upload/pictogramme_sound/:id/:style/:basename.:extension"
 
  
  validates_attachment_presence :picto
  validates_attachment_content_type :picto, :content_type =>  /^image\/(png|gif|jpeg)/
  validates_attachment_content_type :sound, :content_type => ['audio/mpeg'], :if => :sound_attached?
   
  attr_accessible :name, :grammar_pictogramme_id, :picto, :sound, :level_pictogramme_id
  
  validates_presence_of :level_pictogramme_id
  validates_uniqueness_of :name, :case_sensitive => false
 
  before_create :set_auto_value
 
  include Rails.application.routes.url_helpers
  
  def to_jq_upload
    {
      "name" => self.name,
      "size" => read_attribute(:image_file_size),
      "url" => edit_admin_pictogramme_path(self),
      "delete_url" => pictogramme_path(self),
      "delete_type" => "DELETE",
      "thumbnail_url" => picto.url(:thumb),
      "sound_mp3" => (sound.url(:original) if sound?),
      "sound_ogg" => (sound.url(:ogg) if sound?),
      "grammar" => self.grammar_pictogramme.name
    }
  end
  
  
  
  def set_auto_value
    if self.name.nil?
    if picto
      basename ||= File.basename(picto_file_name, '.*')
      basename = basename.split('__')[0]
      
      basename.gsub!('_',' ')
      basename.chomp!
      self.name = basename
      
      if Pictogramme.where(name: self.name).exists?
        self.name = nil
        return
      end
       
      if self.grammar_pictogramme_id == nil
        two_last_characters = self.name[-2,2] if self.name.length >= 2
      if two_last_characters != nil && ( two_last_characters == 'er' || two_last_characters == 'ir' || two_last_characters == 're')
        self.grammar_pictogramme_id = 3 #verbe
      else
        self.grammar_pictogramme_id = 1 #nom
      end   
      end
    end
    end
  end
  
   def sound_attached?
    self.sound.file?
  end
  
   
end
