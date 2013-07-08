class AddPositionToDescribePicturePictogramme < ActiveRecord::Migration
  def change
     add_column :describisations, :position, :integer
  end
end
