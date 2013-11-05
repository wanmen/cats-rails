class Xclub < ActiveRecord::Base
  has_many :xevents, as: :xeventable, dependent: :destroy
  mount_uploader :thumbnail, ImageUploader
end
