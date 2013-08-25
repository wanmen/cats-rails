class Video < ActiveRecord::Base
	has_many :likes, :as => :likeable
	has_many :tags, :as => :tagable
	has_many :rates, :as => :rateable
	has_many :comments, :as => :commentable
end
