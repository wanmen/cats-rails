class Xclub < ActiveRecord::Base
  has_many :xevents, as: :xeventable, dependent: :destroy
end
