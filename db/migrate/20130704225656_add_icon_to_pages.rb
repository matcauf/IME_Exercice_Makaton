class AddIconToPages < ActiveRecord::Migration
  def change
     add_column :pages, :icon, :string
     add_column :pages, :position, :integer
  end
end
