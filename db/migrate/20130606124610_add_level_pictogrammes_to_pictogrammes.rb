class AddLevelPictogrammesToPictogrammes < ActiveRecord::Migration
  def change
    add_column :pictogrammes, :level_pictogramme_id, :integer, :null => false
  end
end
