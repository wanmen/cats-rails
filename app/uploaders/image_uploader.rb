# encoding: utf-8
# The defined image name versions to limit use
IMAGE_UPLOADER_ALLOW_IMAGE_VERSION_NAMES = %(small medium big)
class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  #storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  #def store_dir
  #  "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  #end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
  storage :upyun
  def store_dir
    "#{model.class.to_s.underscore}/#{mounted_as}"
  end

  def default_url
    # You can use FTP to upload a default image
    "#{ActionController::Base.helpers.asset_path}/blank.png#{version_name}"
  end

  # Override url method to implement with "Image Space"
  def url(version_name = "")
    @url ||= super({})
    version_name = version_name.to_s

    return @url if version_name.blank?
    return "/assets/profile.png" if @url.include? "profile.png"

    if not version_name.in?(IMAGE_UPLOADER_ALLOW_IMAGE_VERSION_NAMES)
      # To protected version name using, when it not defined, this will be give an error message in development environment
      raise "ImageUploader version_name:#{version_name} not allow."
    end
    [@url,version_name].join("!") # thumb split with "!"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    if super.present?
      @name ||="#{Digest::MD5.hexdigest(original_filename)}.#{file.extension.downcase}" if original_filename
    end
  end
end
