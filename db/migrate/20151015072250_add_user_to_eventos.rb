class AddUserToEventos < ActiveRecord::Migration
  def change
    add_reference :eventos, :user, index: true
    add_foreign_key :eventos, :users
  end
end
