class Evento < ActiveRecord::Base
  mount_uploader :imagen, ImagenUploader
end
