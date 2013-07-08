ActiveAdmin.register Category do
  menu :priority => 5, :label => "Catégories"
  
  
  filter :name, :label => "Nom"
  filter :created_at, :label => "date de création"
   
    
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
end
