class CreateUserStats < ActiveRecord::Migration
  def change
    create_table :user_stats do |t|
      t.belongs_to :gallery
      t.belongs_to :user

      t.integer :total_three_dif_photo_photos, :default => 0
      t.integer :right_three_dif_photo_photos, :default => 0
      t.integer :total_three_dif_photo_drawings, :default => 0
      t.integer :right_three_dif_photo_drawings, :default => 0
      t.integer :total_three_dif_photo_pictogrammes, :default => 0
      t.integer :right_three_dif_photo_pictogrammes, :default => 0
      t.integer :total_three_dif_photo_words,  :default => 0
      t.integer :right_three_dif_photo_words,  :default => 0

      t.integer :total_three_id_photo_photos,  :default => 0
      t.integer :right_three_id_photo_photos,  :default => 0
      t.integer :total_three_id_drawing_drawings,  :default => 0
      t.integer :right_three_id_drawing_drawings,  :default => 0
      t.integer :total_three_id_pictogramme_pictogrammes,  :default => 0
      t.integer :right_three_id_pictogramme_pictogrammes,  :default => 0

      t.integer :total_two_dif_photo_photos,  :default => 0
      t.integer :right_two_dif_photo_photos,  :default => 0
      t.integer :total_two_dif_photo_drawings,  :default => 0
      t.integer :right_two_dif_photo_drawings,  :default => 0
      t.integer :total_two_dif_photo_pictogrammes,  :default => 0
      t.integer :right_two_dif_photo_pictogrammes,  :default => 0

      t.integer :total_two_id_photo_photos,  :default => 0
      t.integer :right_two_id_photo_photos,  :default => 0
      t.integer :total_two_id_drawing_drawings,  :default => 0
      t.integer :right_two_id_drawing_drawings,  :default => 0
      t.integer :total_two_id_pictogramme_pictogrammes,  :default => 0
      t.integer :right_two_id_pictogramme_pictogrammes,  :default => 0
      t.integer :total_two_dif_photo_words,  :default => 0
      t.integer :right_two_dif_photo_words,  :default => 0

      t.integer :total_two_white_photos,  :default => 0
      t.integer :right_two_white_photos,  :default => 0
      t.integer :total_two_white_drawings,  :default => 0
      t.integer :right_two_white_drawings,  :default => 0
      t.integer :total_two_white_pictogrammes,  :default => 0
      t.integer :right_two_white_pictogrammes,  :default => 0
      

      t.timestamps
    end

    add_index :user_stats, :gallery_id
    add_index :user_stats, :user_id

  end
end
