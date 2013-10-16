class Video < ActiveRecord::Base
	has_many :likes, :as => :likeable, dependent: :destroy
	has_many :taglinks, :as => :tagable, dependent: :destroy
	has_many :rates, :as => :rateable, dependent: :destroy
	has_many :comments, :as => :commentable, dependent: :destroy
	has_many :links, :as => :linkable, dependent: :destroy
	belongs_to :user
	scope :top10, -> {select("videos.id, videos.title, count(likes.id) AS likes_count").joins(:likes).group("videos.id").order("likes_count DESC").limit(10)}
    scope :newest6, -> {select("videos.*").order("created_at desc").limit(6)}
    scope :best6, -> {select("videos.id, videos.title, videos.cover, videos.rate").group("videos.id").order("videos.rate DESC").limit(6)}
end
