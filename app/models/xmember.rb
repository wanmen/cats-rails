class Xmember < ActiveRecord::Base
  belongs_to :xclub, polymorphic: true
  belongs_to :user
end
