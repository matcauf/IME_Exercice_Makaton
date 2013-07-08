class CreateLevelPictogrammes < ActiveRecord::Migration
  def change
    create_table :level_pictogrammes do |t|
      t.string :name,   :null => false 
      t.timestamps
    end
  end
end
