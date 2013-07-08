class CreatePictogrammes < ActiveRecord::Migration
  def change
    create_table :pictogrammes do |t|
      t.string :name,      :null => false
      t.integer :grammar_pictogramme_id
      t.timestamps
    end
  end
end
