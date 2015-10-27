class AddCoordsToEventos < ActiveRecord::Migration
  def change
    add_column :eventos, :long, :float
    add_column :eventos, :lat, :float
  end
end
