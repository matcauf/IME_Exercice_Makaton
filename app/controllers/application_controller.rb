#encoding: utf-8
class ApplicationController < ActionController::Base

  before_filter :navigation_categories
  
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end


  def  navigation_categories
    @navigation_categories = Hash.new
    Category.order("name ").each do |category|
       @navigation_categories[category] = category.galleries.find(:all,
       :joins => [:image_types , :pictogramme],
       :group => "galleries.id",
        :having => "count(case image_types.name when 'photo' then 1 else null end ) >=2 
    AND count(case image_types.name when 'dessin' then 1 else null end) >=1",
        :order => "pictogrammes.name")
    end

  end
 
 def after_sign_in_path_for(resource)
   
    if current_user.has_role? :super_admin or current_user.has_role? :admin or current_user.has_role? :teacher
      admin_root_path
    else
      root_path
    end
  end
  
  def authenticate_active_admin_user!
    authenticate_user!
    unless current_user.has_role? :super_admin or current_user.has_role? :admin or current_user.has_role? :teacher
      flash[:alert] = "Vous n'avez pas les authorisations neccesaires"
      redirect_to root_path
    end
  end
 
end
