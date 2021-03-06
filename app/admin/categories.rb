ActiveAdmin.register Category do
  menu :priority => 5, :label => "Catégories"
  
  
  filter :name, :label => "Nom"
  filter :created_at, :label => "date de création"
   action_item do
     link_to "Créer une sous-Catégorie", new_admin_gallery_path
   end
    
    
   index :title => "Catégories" do
    selectable_column
    id_column
    column "Nom", :name
    column "Date de creation",:created_at
    column "Sous Categories" do |category|
      galleries = category.galleries
      if !galleries.nil?
        render :partial => "galleries", :locals => { :galleries => galleries }
      end
    end
    column "" do |category|
      link_to "associer une sous-catégorie", new_admin_gallery_path({:category_id => category.id})
    end
    default_actions
  end
  show do |category|
     attributes_table do
        row :nom do
          category.name
        end
        row :galleries do
          galleries = category.galleries
      if !galleries.nil?
        render :partial => "galleries", :locals => { :galleries => galleries }
      end
        end
      end
  end
  
  form do |f|
    f.inputs "Categorie" do
        f.input :name, :label => "Nom"
    end
    f.actions
end
end
