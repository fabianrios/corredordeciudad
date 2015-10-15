class AddDuracionToEventos < ActiveRecord::Migration
  def change
    add_column :eventos, :duracion, :time
  end
end
