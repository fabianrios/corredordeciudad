class AddPublishToEventos < ActiveRecord::Migration
  def change
    add_column :eventos, :publish, :boolean
  end
end
