class CreateImageTypes < ActiveRecord::Migration
  def change
    create_table :image_types do |t|
      t.string :name,      :null => false
      t.timestamps
    end
  end
end
