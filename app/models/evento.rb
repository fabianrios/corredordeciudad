class Evento < ActiveRecord::Base
  validates_presence_of :nombre, :lugar, :direccion, :descripcion, :cuando, :user
  acts_as_taggable
  mount_uploader :imagen, ImagenUploader
  belongs_to :user
  
  def self.closer_date(_date)
    where("cuando > ?", _date).where(:publish => true).order("cuando ASC")
  end
  
  def self.neighbor(neighbor)
    where(:publish => true).order("cuando ASC")
  end
  
end
