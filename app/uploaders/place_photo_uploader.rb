# encoding: utf-8

class PlacePhotoUploader < CarrierWave::Uploader::Base
  version :default

  if Rails.env.production? || Rails.env.development?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    "http://youqueen.com/wp-content/uploads/2012/05/Drawing-Picture.jpg"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  include CarrierWave::MiniMagick

  process :resize_to_fit => [500, 500]

  version :thumb do
    process :resize_to_fill => [200, 200]
  end
end
