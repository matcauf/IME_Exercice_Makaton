ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
     columns do

      

      column do
        panel "Connections recentes" do
          table_for User.order('last_sign_in_at desc').limit(10).each do |user|
            column(:username)
          end
        end
      end

    end # columns
  end # content
end
