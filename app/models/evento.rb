class Evento < ActiveRecord::Base
  validates_presence_of :nombre, :lugar, :direccion, :descripcion, :cuando, :user
  validates_presence_of :necesidades, :if => :espacio?
  validates_inclusion_of :lat, :in => 6.0..6.9, :allow_blank => true
  validates_inclusion_of :long, :in => -80..-70, :allow_blank => true
  
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
