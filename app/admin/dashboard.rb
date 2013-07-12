ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
     columns do

      column do
        panel "Connexions recentes" do
          table_for User.order('last_sign_in_at desc').limit(10).each do |user|
            column("Identifiant",:username )
            column("dernière connexion", :last_sign_in_at )
          end
        end
      end
      column do 
        panel " Statistiques" do
          div do
            "Utilisateurs " + User.count.to_s
          end
          div do
            "Pictogrammes: " + Pictogramme.count.to_s
          end
          div do
            "Catégories: " + Category.count.to_s
          end
          div do
            "Sous-catégories: " + Gallery.count.to_s
          end
          div do
            "Images: " + Picture.count.to_s
          end
          div do
            "Exercices de description: " + DescribePicture.count.to_s
          end
        end
        
      end
    end # columns
  end # content
end
