class Video < ActiveRecord::Base
	has_many :likes, :as => :likeable
	has_many :taglinks, :as => :tagable
	has_many :rates, :as => :rateable
	has_many :comments, :as => :commentable
	has_many :links, :as => :linkable
	belongs_to :user
end
