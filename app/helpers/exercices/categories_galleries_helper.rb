module Exercices::CategoriesGalleriesHelper
  
  def initialize_exercice params, answer
    @exercice_type = params[:type]
    @true_answer_number = 1 + rand(answer.to_i)
    @answers = []
    @title = exercice_name  @exercice_type
    if params[:id_gallery] == 'false' && params[:id_category] == 'false'
      random_galleries = valid_galleries answer.to_i
      @gallery= random_galleries.shift
      @category = @gallery.category
      @title << " toutes catégories en aléatoire"
      if(answer.to_i > 2)       
        return random_galleries
      else
        return random_galleries.first
      end
    elsif params[:id_gallery] == 'false'
       @category = Category.find(params[:id_category])
      @gallery = valid_gallery @category
      @title << " en aléatoire sur "+ @category.name
      
    else
       @category = Category.find(params[:id_category])
      @gallery = Gallery.find(params[:id_gallery])
         @title << " sur "+ @gallery.pictogramme.name + " de catégorie " + @category.name
    end 
   
    
    if answer.to_i  > 2
      @category.galleries.joins(:image_types).group("galleries.id").having("count(case image_types.name when 'photo' then 1 else null end ) >=2 
    AND count(case image_types.name when 'dessin' then 1 else null end) >=1").where(' galleries.id != ' + @gallery.id.to_s).random(answer - 1)
    else
       @category.galleries.joins(:image_types).group("galleries.id").having("count(case image_types.name when 'photo' then 1 else null end ) >=2 
    AND count(case image_types.name when 'dessin' then 1 else null end) >=1").where(' galleries.id != ' + @gallery.id.to_s).random
     end
  end
  
  def valid_galleries gallery_numbers
    Gallery.joins(:image_types).group("galleries.id").having("count(case image_types.name when 'photo' then 1 else null end ) >=2 
    AND count(case image_types.name when 'dessin' then 1 else null end) >=1").random(gallery_numbers)
  end
  
  def valid_gallery category
    category.galleries.joins(:image_types).group("galleries.id").having("count(case image_types.name when 'photo' then 1 else null end ) >=2 
    AND count(case image_types.name when 'dessin' then 1 else null end) >=1").random

  end
  
  def exercice_name type
     case type
   when 'photo3DIFphotos'
     "Quiz 3 images photo & photos"
   when 'photo3DIFdessins'
     "Quiz 3 images photo & dessins"
   when 'photo3DIFpictogrammes'
     "Quiz 3 images photo & pictogrammes"
   when 'photo3DIFwords'
     "Quiz 3 images photo & mots"
   when 'photo3IDphotos'
     "Quiz 3 images photos identiques"
   when'dessin3IDdessins'
     "Quiz 3 images dessins identiques"
   when 'pictogramme3IDpictogrammes'
     "Quiz 3 images pictogrammes identiques"
   when 'photo2DIFphotos'
     "Quiz 2 images photo & photos"
   when 'photo2DIFdessins'
     "Quiz 2 images photo & dessins"
   when 'photo2DIFpictogrammes'
     "Quiz 2 images photo & pictogrammes"
   when 'photo2DIFwords'
     "Quiz 2 images photo & mots"
   when 'photo2IDphotos'
     "Quiz 2 images photos identiques"
   when'dessin2IDdessins'
    "Quiz 2 images dessins identiques"
   when 'pictogramme2IDpictogrammes'
    "Quiz 2 images pictogrammes identiques"
   when 'photo2Whitephotos'
    "Quiz 2 images photo & cadre blanc"
   when'dessin2Whitedessins'
    "Quiz 2 images dessins & cadre blanc"
   when 'pictogramme2Whitepictogrammes'
    "Quiz 2 images pictogrammes & cadre blanc"
    end
  end
end
