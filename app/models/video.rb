class Video < ActiveRecord::Base
	has_many :likes, :as => :likeable
	has_many :taglinks, :as => :tagable
	has_many :rates, :as => :rateable
	has_many :comments, :as => :commentable
	has_many :links, :as => :linkable
	belongs_to :user
	scope :top10,->{select("videos.id, videos.title, count(likes.id) AS likes_count").joins(:likes).group("videos.id").order("likes_count DESC").limit(10)}
    scope :newest6,->{select("videos.*").order("created_at desc").limit(6)}
    scope :best6,->{select("videos.id, videos.title, videos.cover, count(rates.id) AS rates_count").joins(:rates).group("videos.id").order("rates_count DESC").limit(6)}
end
