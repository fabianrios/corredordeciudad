class Evento < ActiveRecord::Base
  validates_presence_of :nombre, :lugar, :direccion, :descripcion, :cuando, :user
  mount_uploader :imagen, ImagenUploader
  belongs_to :user
end
