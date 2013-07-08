ActiveAdmin.register Page do
  filter :name, :label => "Nom"
  filter :created_at, :label => "date de création"
  
   
   index do
    selectable_column
    id_column
    column "Nom", :name
    column :permalink
    column "Contnu", :content
    column "Date de création", :created_at
    
    default_actions
  end
  
  show do |page|
     attributes_table do
        row :nom do
          page.name
        end
        row :permalink
        row :contenu do
         page.content
        end
         row :icon
      end
  end
   sidebar :icon do
   render "icon"
  end
  form do |f|
    f.inputs "Page" do
        f.input :name, :label => "Nom"
        f.input :permalink
        f.input :content, :label => "Contenu"
        f.input :icon
        f.input :position
    end
    f.actions
end
  
end
