class NoEmailRequired < ActiveRecord::Migration
  def up
    change_column :users, :email,  :string, :null => true 
    remove_index  :users, :column => :email
    add_index :users, :username, :unique => true
  end

  def down
    remove_index :users, :column => :username
    add_index :users, :email,                :unique => true
    change_column :users, :email,              :null => false, :default => ""
  end
end
