class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.string :nombre
      t.string :lugar
      t.string :direccion
      t.boolean :espacio
      t.text :necesidades
      t.text :descripcion
      t.string :web
      t.datetime :cuando
      t.string :imagen

      t.timestamps null: false
    end
  end
end
