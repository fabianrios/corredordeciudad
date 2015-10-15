class Evento < ActiveRecord::Base
  validates_presence_of :nombre, :lugar, :direccion, :descripcion, :cuando
  mount_uploader :imagen, ImagenUploader
end
