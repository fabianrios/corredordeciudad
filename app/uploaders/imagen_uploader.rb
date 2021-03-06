# encoding: utf-8

class ImagenUploader < CarrierWave::Uploader::Base

  
  # include CarrierWaveDirect::Uploader
  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  include Sprockets::Rails::Helper
  
  # include CarrierWave::MimeTypes
  # process :set_content_type

  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :fog
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  # def store_dir
#     "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
#   end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  # 
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end
  
  # def default_url
  #   "https://s3-us-west-2.amazonaws.com/prototeca/hexagons/" + [version_name, "default.jpg"].compact.join('_')
  # end
  
  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end
  # process crop: :foto
  # Create different versions of your uploaded files:  
  version :thumb do
    process :resize_to_limit => [200, 200]
  end
  
  version :big do
    process :resize_to_limit => [600,600]
  end

  # Add a white list of extensions which are allowed to be uploaded.
   # For images you might use something like this:
   def extension_white_list
     %w(jpg jpeg gif png)
   end
   
  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
