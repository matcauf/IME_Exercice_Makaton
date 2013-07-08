class CreateDescribePictures < ActiveRecord::Migration
  def change
    create_table :describe_pictures do |t|

      t.timestamps
    end
  end
end
