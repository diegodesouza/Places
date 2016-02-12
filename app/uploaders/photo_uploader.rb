# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base

  version :default

  if Rails.env.production? || Rails.env.development?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # def default_url
    # # asset_path("fallback/" [thumb, 'images.jpeg'].compact.join('_'))
    # ActionController::Base.helpers.asset_path("fallback/" + [thumb, "images.jpeg"].compact.join('_'))
    # # 'images.jpeg'
  # end

  def default_url
    "/images/fallback/" + [thumb, "images.jpeg"].compact.join('_')
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  include CarrierWave::MiniMagick

  process :resize_to_fit => [800, 800]

  version :thumb do
    process :resize_to_fill => [150, 150]
  end
end
