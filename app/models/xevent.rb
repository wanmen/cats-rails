class Xevent < ActiveRecord::Base
  belongs_to :xclub
  scope :latest5, -> { select("xevents.id, xevents.title, xevents.summary, xevents.xclub_id").order("created_at desc").limit(5) }
end
