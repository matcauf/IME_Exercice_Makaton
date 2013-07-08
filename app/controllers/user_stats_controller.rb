#encoding: utf-8
class UserStatsController < ApplicationController
  before_filter :authenticate_user!
  protect_from_forgery except: :score
   def score
     @user_stat = UserStat.find_by_user_id_and_gallery_id(params[:user_id], params[:gallery_id])
  
    
    case params[:type]
   when 'photo3DIFphotos'
      @user_stat.update_attributes(:right_three_dif_photo_photos => (@user_stat.right_three_dif_photo_photos + 1)) if params[:answer] == 'true'
      @user_stat.update_attributes(:total_three_dif_photo_photos => (@user_stat.total_three_dif_photo_photos + 1))
   when 'photo3DIFdessins'
      @user_stat.update_attributes(:right_three_dif_photo_drawings => (@user_stat.right_three_dif_photo_drawings + 1)) if params[:answer] == 'true'
      @user_stat.update_attributes(:total_three_dif_photo_drawings => (@user_stat.total_three_dif_photo_drawings + 1))
   when 'photo3DIFpictogrammes'
      @user_stat.update_attributes(:right_three_dif_photo_pictogrammes => (@user_stat.right_three_dif_photo_pictogrammes + 1)) if params[:answer] == 'true'
      @user_stat.update_attributes(:total_three_dif_photo_pictogrammes => (@user_stat.total_three_dif_photo_pictogrammes + 1))
   when 'photo3DIFwords'
      @user_stat.update_attributes(:right_three_dif_photo_words => (@user_stat.right_three_dif_photo_words + 1)) if params[:answer] == 'true'
      @user_stat.update_attributes(:total_three_dif_photo_words => (@user_stat.total_three_dif_photo_words + 1))   
   when 'photo3IDphotos'
      @user_stat.update_attributes(:right_three_id_photo_photos => (@user_stat.right_three_id_photo_photos + 1)) if params[:answer] == 'true'
      @user_stat.update_attributes(:total_three_id_photo_photos => (@user_stat.total_three_id_photo_photos + 1))
   when'dessin3IDdessins'
      @user_stat.update_attributes(:right_three_id_drawing_drawings => (@user_stat.right_three_id_drawing_drawings + 1)) if params[:answer] == 'true'
      @user_stat.update_attributes(:total_three_id_drawing_drawings => (@user_stat.total_three_id_drawing_drawings + 1))
   when 'pictogramme3IDpictogrammes'
      @user_stat.update_attributes(:right_three_id_pictogramme_pictogrammes => (@user_stat.right_three_id_pictogramme_pictogrammes + 1)) if params[:answer] == 'true'
      @user_stat.update_attributes(:total_three_id_pictogramme_pictogrammes => (@user_stat.total_three_id_pictogramme_pictogrammes + 1))  
   when 'photo2DIFphotos'
      @user_stat.update_attributes(:right_two_dif_photo_photos => (@user_stat.right_two_dif_photo_photos + 1)) if params[:answer] == 'true'
      @user_stat.update_attributes(:total_two_dif_photo_photos => (@user_stat.total_two_dif_photo_photos + 1))
   when 'photo2DIFdessins'
      @user_stat.update_attributes(:right_two_dif_photo_drawings => (@user_stat.right_two_dif_photo_drawings + 1)) if params[:answer] == 'true'
      @user_stat.update_attributes(:total_two_dif_photo_drawings => (@user_stat.total_two_dif_photo_drawings + 1))
   when 'photo2DIFpictogrammes'
      @user_stat.update_attributes(:right_two_dif_photo_pictogrammes => (@user_stat.right_two_dif_photo_pictogrammes + 1)) if params[:answer] == 'true'
      @user_stat.update_attributes(:total_two_dif_photo_pictogrammes => (@user_stat.total_two_dif_photo_pictogrammes + 1))
   when 'photo2DIFwords'
      @user_stat.update_attributes(:right_two_dif_photo_words => (@user_stat.right_two_dif_photo_words + 1)) if params[:answer] == 'true'
      @user_stat.update_attributes(:total_two_dif_photo_words => (@user_stat.total_two_dif_photo_words + 1))
   
   when 'photo2IDphotos'
      @user_stat.update_attributes(:right_two_id_photo_photos => (@user_stat.right_two_id_photo_photos + 1)) if params[:answer] == 'true'
      @user_stat.update_attributes(:total_two_id_photo_photos => (@user_stat.total_two_id_photo_photos + 1))
   when'dessin2IDdessins'
      @user_stat.update_attributes(:right_two_id_drawing_drawings => (@user_stat.right_two_id_drawing_drawings + 1)) if params[:answer] == 'true'
      @user_stat.update_attributes(:total_two_id_drawing_drawings => (@user_stat.total_two_id_drawing_drawings + 1))
   when 'pictogramme2IDpictogrammes'
      @user_stat.update_attributes(:right_two_id_pictogramme_pictogrammes => (@user_stat.right_two_id_pictogramme_pictogrammes + 1)) if params[:answer] == 'true'
      @user_stat.update_attributes(:total_two_id_pictogramme_pictogrammes => (@user_stat.total_two_id_pictogramme_pictogrammes + 1))  
   when 'photo2Whitephotos'
      @user_stat.update_attributes(:right_two_white_photos => (@user_stat.right_two_white_photos + 1)) if params[:answer] == 'true'
      @user_stat.update_attributes(:total_two_white_photos => (@user_stat.total_two_white_photos + 1))
   when'dessin2Whitedessins'
      @user_stat.update_attributes(:right_two_white_drawings => (@user_stat.right_two_white_drawings + 1)) if params[:answer] == 'true'
      @user_stat.update_attributes(:total_two_white_drawings => (@user_stat.total_two_white_drawings + 1))
   when 'pictogramme2Whitepictogrammes'
      @user_stat.update_attributes(:right_two_white_pictogrammes => (@user_stat.right_two_white_pictogrammes + 1)) if params[:answer] == 'true'
      @user_stat.update_attributes(:total_two_white_pictogrammes => (@user_stat.total_two_white_pictogrammes + 1))
    end
    render :nothing => true
  end
end
