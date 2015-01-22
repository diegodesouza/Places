# encoding: utf-8

class ImageOneUploader < CarrierWave::Uploader::Base
  version :default

  if Rails.env.production? || Rails.env.development?
    storage :fog
  else
    storage :file
  end
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
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
