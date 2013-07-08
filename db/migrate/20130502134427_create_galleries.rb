class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.integer :category_id,   :null => false
      t.integer :pictogramme_id, :null => false
      t.timestamps
    end
  end
end
