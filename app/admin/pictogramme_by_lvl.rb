ActiveAdmin.register_page "Pictogrammes_by_lvl",  :as => "Pictogrammes par niveau" do
 
 menu :priority => 4, :label => "Pictogrammes par niveaux" 
   content :title => "Pictogrammes par niveaux"  do
    render "index"
  end
end
