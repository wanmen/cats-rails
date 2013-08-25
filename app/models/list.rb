class List < ActiveRecord::Base
  belongs_to :admin
  has_many :tags, :as => :tagable
  has_many :likes, :as => :likeable
  has_many :rates, :as => :rateable
end
