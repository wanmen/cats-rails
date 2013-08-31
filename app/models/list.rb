class List < ActiveRecord::Base
  belongs_to :user
  has_many :tags, :as => :tagable
  has_many :likes, :as => :likeable
  has_many :rates, :as => :rateable
  has_many :links
end
