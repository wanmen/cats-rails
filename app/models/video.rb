class Video < ActiveRecord::Base
	has_many :likes, :as => :likeable
	has_many :taglinks, :as => :tagable
	has_many :rates, :as => :rateable
	has_many :comments, :as => :commentable
	has_many :links, :as => :linkable
	belongs_to :user
	scope :top5,select("videos.id, videos.title, videos.cover, count(likes.id) AS likes_count").joins(:likes).group("videos.id").order("likes_count DESC").limit(5)
end
