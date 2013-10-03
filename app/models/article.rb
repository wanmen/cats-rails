class Article < ActiveRecord::Base
	has_many :likes, :as => :likeable
	has_many :taglinks, :as => :tagable
	has_many :rates, :as => :rateable
	has_many :comments, :as => :commentable
	has_many :links, :as => :linkable
	belongs_to :user
  scope :pop6, ->{ select("articles.id, articles.title, articles.summary, articles.user_id, articles.updated_at, count(likes.id) AS likes_count").joins(:likes).group("articles.id").order("likes_count DESC").limit(6)}
  scope :newest10, ->{ select("articles.id,articles.title").order("created_at desc").limit(10)}
end
