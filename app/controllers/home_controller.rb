
#encoding: utf-8
class HomeController < ApplicationController
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
  end
  
end
