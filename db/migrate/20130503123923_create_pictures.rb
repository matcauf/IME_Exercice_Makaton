class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :gallery_id
      t.integer :image_type_id,  :null => false
      t.timestamps
      t.timestamps
    end
  end
end
