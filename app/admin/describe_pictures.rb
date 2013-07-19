ActiveAdmin.register DescribePicture do
   config.batch_actions = true
    menu :priority => 7, :label => "Exercices de description"
    
    
    filter :created_at
    
    index :title => "Exercice de description" do
    selectable_column
    id_column
    column "image" do |describe_picture|
      image_tag(describe_picture.describe_image.url(:thumb))
    end
    column "description" do |describe_picture|
      render :partial => "pictogramme", :locals => { :pictogrammes => describe_picture.pictogrammes }
    end
    column "date de création", :created_at
    default_actions
  end
  
  show do |describe_picture|
     attributes_table do
        row :image do
          image_tag(describe_picture.describe_image.url(:thumb))
        end
        row :description do
         render :partial => "pictogramme_img", :locals => { :pictogrammes => describe_picture.pictogrammes }
        end
      end
  end
  form do |f|
    f.inputs "Description" do
        f.semantic_errors *f.object.errors.keys
        f.input :describe_image ,:label => "image", :as => :file, :input_html => {:accept => "image/*" }, :hint => f.template.image_tag(f.object.describe_image.url(:thumb))
        f.input :pictogramme_tokens,:label => "Sens de l'image", :input_html => { :id => "describe_picture_pictogramme_tokens" }
    end
     f.actions
  end
  
  
   
end
