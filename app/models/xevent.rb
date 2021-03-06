class Xevent < ActiveRecord::Base
  belongs_to :xclub
  mount_uploader :cover, ImageUploader
  scope :latest5, -> { select("xevents.id, xevents.title, xevents.time, xevents.location, xevents.xclub_id").order("created_at desc").limit(5) }
end
