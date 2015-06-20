class Uploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    'images'
  end
  process :resize_to_fill => [200, 200]
end
