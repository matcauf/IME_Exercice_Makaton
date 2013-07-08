class CreateDescribisations < ActiveRecord::Migration
  def change
    create_table :describisations do |t|

      t.belongs_to :describe_picture
      t.belongs_to :pictogramme

      t.timestamps
    end
    add_index :describisations, :describe_picture_id
    add_index :describisations, :pictogramme_id
  
  end
end
