class AddOrganizaToEventos < ActiveRecord::Migration
  def change
    add_column :eventos, :organiza, :string
  end
end
