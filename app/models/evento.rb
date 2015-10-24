class Evento < ActiveRecord::Base
  validates_presence_of :nombre, :lugar, :direccion, :descripcion, :cuando, :user
  acts_as_taggable
  mount_uploader :imagen, ImagenUploader
  belongs_to :user
end
