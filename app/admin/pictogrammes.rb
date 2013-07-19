ActiveAdmin.register Pictogramme do
  filter :name, :label => "Nom"
  filter :level_pictogramme, :label => "Niveau du pictogramme" 
  filter :grammar_pictogramme, :label => "Catégorie de mot"
  filter :created_at, :label => "date de création"
  
  menu :priority => 3
   
   index do
    selectable_column
    id_column
    column "Nom", :name
    column "Niveau", :level_pictogramme
    column "Catégorie", :grammar_pictogramme 
    column "Pictogramme" do |pictogramme|
      image_tag(pictogramme.picto.url(:thumb))
    end
    column "Fichier son" do |pictogramme|
    render :partial => "sound", :locals => { :pictogramme => pictogramme }
    end
    column "Date de création", :created_at
    
    default_actions
  end
  
  show do |pictogramme|
     attributes_table do
        row :nom do
          pictogramme.name
        end
        row :image do
          image_tag(pictogramme.picto.url)
        end
        row :niveau do
          pictogramme.level_pictogramme
        end
        row :type do
          pictogramme.grammar_pictogramme
        end
        row :son do
          render :partial => "sound", :locals => { :pictogramme => pictogramme }
        end
        
      end
  end
  
  form do |f|
    f.inputs "Pictogramme" do
        f.input :name, :label => "Nom"
        f.input :grammar_pictogramme, :label => "Catégorie de mot"
        f.input :level_pictogramme, :label => "Niveau du pictogramme"
        f.input :picto, :label => "Pictogramme", :as => :file, :input_html => {:accept => "image/*" },  :hint => f.template.image_tag(f.object.picto.url)
        f.input :sound, :label => "son", :as => :file, :input_html => {:accept => "audio/mpeg" }
    end
    f.actions
end
end
