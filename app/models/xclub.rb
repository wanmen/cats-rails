class Xclub < ActiveRecord::Base
  has_many :xevents, dependent: :destroy
end
