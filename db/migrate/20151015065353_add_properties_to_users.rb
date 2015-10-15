class AddPropertiesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nombre, :string
    add_column :users, :lugar, :string
    add_column :users, :direccion, :string
    add_column :users, :telefono, :string
    add_column :users, :comuna, :string
    add_column :users, :barrio, :string
    add_column :users, :categoria, :string
    add_column :users, :logo, :string
    add_column :users, :web, :string
    add_column :users, :imagen, :string
    add_column :users, :descripcion, :text
  end
end
