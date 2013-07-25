
#encoding: utf-8
class HomeController < ApplicationController
  #for exercise names
  include Exercices::CategoriesGalleriesHelper
  def index
  @pages = Page.order("position ASC")
  end
  
  def quiz_two_pictures_menu
 
  end
  
  def quiz_three_pictures_menu
    
  end
  
  def select_category_gallery
    @action = params[:exercice_controller]
    @type = params[:type]
    @number = params[:number]
    @title = exercice_name params[:type]
    @navigation_categories.collect do |k,v|
      return if v.length >= @number.to_i
    end  
     redirect_to root_path, :alert => "Aucune Catégorie valable"
     return  
  end
  
end
