class UserStat < ActiveRecord::Base
  belongs_to :gallery
  belongs_to :user

  attr_accessible :total_three_dif_photo_photos, :right_three_dif_photo_photos, :total_three_dif_photo_drawings, :right_three_dif_photo_drawings, :total_three_dif_photo_pictogrammes, :right_three_dif_photo_pictogrammes
  attr_accessible :total_three_id_photo_photos, :right_three_id_photo_photos, :total_three_id_drawing_drawings, :right_three_id_drawing_drawings, :total_three_id_pictogramme_pictogrammes, :right_three_id_pictogramme_pictogrammes
  attr_accessible :total_two_id_photo_photos, :right_two_id_photo_photos, :total_two_id_drawing_drawings, :right_two_id_drawing_drawings, :total_two_id_pictogramme_pictogrammes, :right_two_id_pictogramme_pictogrammes
  attr_accessible :total_two_white_photos, :right_two_white_photos, :total_two_white_drawings, :right_two_white_drawings, :total_two_white_pictogrammes, :right_two_white_pictogrammes
  attr_accessible :total_two_dif_photo_photos, :right_two_dif_photo_photos, :total_two_dif_photo_drawings, :right_two_dif_photo_drawings, :total_two_dif_photo_pictogrammes, :right_two_dif_photo_pictogrammes
  attr_accessible :total_three_dif_photo_words, :right_three_dif_photo_words, :total_two_dif_photo_words, :right_two_dif_photo_words
  
 def two_detailled_stats
   i = []
   i << [ "Photo/Photos",average( [right_two_dif_photo_photos],[total_two_dif_photo_photos] ) ]
   i << [ "Photo/Dessins", average( [right_two_dif_photo_drawings], [total_two_dif_photo_drawings] ) ]
   i << [ "Photo/Pictogrammes", average( [right_two_dif_photo_pictogrammes], [total_two_dif_photo_pictogrammes] ) ]
   i << [ "Photo/Mots", average( [right_two_dif_photo_words], [total_two_dif_photo_words] ) ]
   i << [ "Photos identiques", average( [right_two_id_photo_photos], [total_two_id_photo_photos] ) ]
   i << [ "Dessins identiques", average( [right_two_id_drawing_drawings], [total_two_id_drawing_drawings] ) ]
   i << [ "Pictogrammes identiques", average( [right_two_id_pictogramme_pictogrammes], [total_two_id_pictogramme_pictogrammes] ) ]
   i << [ "Photos & blanc", average( [right_two_white_photos], [total_two_white_photos] ) ]
   i << [ "Dessins & blanc", average( [right_two_white_drawings], [total_two_white_drawings] ) ]
   i << [ "Pictogrammes & blanc", average( [right_two_white_pictogrammes], [total_two_white_pictogrammes] ) ]
   return i   
 end

  def two_pictures_average
    average([ right_two_id_photo_photos, right_two_id_drawing_drawings, right_two_id_pictogramme_pictogrammes, right_two_white_photos, right_two_white_drawings, right_two_white_pictogrammes, right_two_dif_photo_photos, right_two_dif_photo_drawings, right_two_dif_photo_pictogrammes, right_two_dif_photo_words ] ,[ total_two_id_photo_photos, total_two_id_drawing_drawings, total_two_id_pictogramme_pictogrammes, total_two_white_photos, total_two_white_drawings, total_two_white_pictogrammes, total_two_dif_photo_photos, total_two_dif_photo_drawings, total_two_dif_photo_pictogrammes, total_two_dif_photo_words ])
  end

def three_detailled_stats
   i = []
   i << [ "Photo/Photos", average( [right_three_dif_photo_photos], [total_three_dif_photo_photos] ) ]
   i << [ "Photo/Dessins", average( [right_three_dif_photo_drawings], [total_three_dif_photo_drawings] ) ]
   i << [ "Photo/Pictogrammes", average( [right_three_dif_photo_pictogrammes], [total_three_dif_photo_pictogrammes] ) ]
   i << [ "Photo/Mots", average( [right_three_dif_photo_words], [total_three_dif_photo_words] ) ]
   i << [ "Photos identiques", average( [right_three_id_photo_photos], [total_three_id_photo_photos] ) ]
   i << [ "Dessins identiques", average( [right_three_id_drawing_drawings], [total_three_id_drawing_drawings] ) ]
   i << [ "Pictogrammes identiques", average( [right_three_id_pictogramme_pictogrammes], [total_three_id_pictogramme_pictogrammes] ) ]
   return i
end

  def three_pictures_average
    average([ right_three_id_photo_photos, right_three_id_drawing_drawings, right_three_id_pictogramme_pictogrammes, right_three_dif_photo_photos, right_three_dif_photo_drawings, right_three_dif_photo_pictogrammes, right_three_dif_photo_words  ] ,[ total_three_id_photo_photos, total_three_id_drawing_drawings, total_three_id_pictogramme_pictogrammes, total_three_dif_photo_photos, total_three_dif_photo_drawings, total_three_dif_photo_pictogrammes, total_three_dif_photo_words ])
  end
  private

  def average(right=[],total=[])
    100*(right.sum.to_f/(total.sum.to_f.nonzero? ||1))
  end

end
