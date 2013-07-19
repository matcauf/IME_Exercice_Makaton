ActiveAdmin.register Gallery do
  config.batch_actions = true
  menu :priority => 6, :label => "Sous-catégories"
  
  filter :category, :label => "Categorie"
  filter :created_at, :label => "Date de création"
  
   index :title => "Sous-catégories"  do
    selectable_column
    id_column
    column "Nom" do |gallery|
      gallery.pictogramme.name
    end
    column :created_at
    default_actions
  end
  
  
  show  :title => "Visualisation de la gallerie" do
    render "show"
  end
  
  form :title => "Création d'une sous-catégorie" do |f|
     f.inputs "Sous-catégorie" do
    f.input :category, :label => "Catégorie", :collection => Category.order('name ASC')
    f.input :pictogramme, :collection => Pictogramme.order('name ASC')
    end
    f.actions
  end
  
end
