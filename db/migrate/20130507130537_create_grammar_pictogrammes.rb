class CreateGrammarPictogrammes < ActiveRecord::Migration
  def change
    create_table :grammar_pictogrammes do |t|
      t.string :name,      :null => false
      t.timestamps
    end
  end
end
