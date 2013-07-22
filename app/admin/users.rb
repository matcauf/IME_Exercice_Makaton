ActiveAdmin.register User do
  config.batch_actions = true

  menu :priority => 2, :label => "Utilisateurs"

  scope :admins, :if => proc{ current_user.has_role? :admin }
  scope :enseignants, :if => proc{ current_user.has_role? :admin }
  scope :utilisateurs

  filter :username, :label => "Nom d'utilisateur"
  filter :last_sign_in_at, :label => "Dernière connexion"
  filter :created_at, :label => "Date de création"

batch_action :destroy, :if => proc{can?(:destroy, User)} do |user|
  redirect_to admin_users_path, :alert => "Vous ne pouvez pas suprimer ces Utilisateurs l'un d'entre eux a un rang supérieur au votre"
end
  collection_action :assign_role, :method => :post
  member_action :change_role do
    @user = User.find(params[:id])

  end

  index :title => "Utilisateurs" do
    selectable_column
    id_column
    column "Nom d'utilisateur",:username
    if can?(:assign_role,User)
      column "Rang" do |user|
        link_to t(user.roles.first.name), change_role_admin_user_path(user)
      end
    end
    column "Dernière connexion",:last_sign_in_at
    column "Date de création",:created_at
    default_actions

  end

  form do |f|
    f.inputs "User" do
      f.input :username, :label => "Nom d'utilisateur"
      f.input :password, :label => "Mot de passe"

    end
    f.actions(:submit)
  end

  show do
    render "show"
    active_admin_comments
  end
  controller do
    
    
    def destroy
      user = User.find(params[:id])
      if user == current_user
        redirect_to admin_users_path, :notice => "Vous ne pouvez pas vous supprimer!"
      elsif user.has_role? :admin and current_user.has_role? :teacher
        redirect_to admin_users_path, :notice => "Vous ne pouvez pas supprimer d'administrateurs!"
      elsif  user.has_role? :teacher and current_user.has_role? :teacher
        redirect_to admin_users_path, :notice => "Vous ne pouvez pas supprimer vos collégues!"
      else
        user.destroy
        redirect_to users_admin_path, :notice => "Utilisateur effacé."
      end
    end

    def change_role
      unless can?(:change_role,User)
          redirect_to  admin_users_path, :notice => "Vous n'avez pas les droits pour changer les droits..."
        else
          @user= User.find(params[:id])
      end
    end
    
    def assign_role
      @user = User.find(params[:user][:id])
      if @user.has_role? :super_admin
             redirect_to  admin_users_path, :notice => "On ne peut pas faire rétrograder un super Admin"
             return
          end
      if can?(:assign_role,User)
         params[:user][:role_ids].each do |role|
           if role!=""
           if Role.find(role).name == "super_admin"
          redirect_to  admin_users_path, :notice => "On ne peut pas faire de super Admin"
          return
        end
        end
        end
        

        if @user.role_ids = params[:user][:role_ids]
          redirect_to  admin_users_path, :notice => @user.username + " est maintenant un " + t(@user.roles.first.name).titleize
        else
          redirect_to  admin_users_path, :alert => "Erreur impossible de mettre un à jour l'utilisateur."
        end
     else
      redirect_to  admin_users_path, :notice => "Vous n'avez pas les droits pour changer les droits..."
      end
    end
  end
end
