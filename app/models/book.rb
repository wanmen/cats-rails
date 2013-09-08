class Book < ActiveRecord::Base
	has_many :taglinks, :as => :tagable
	has_many :likes, :as => :likeable
	has_many :comments, :as => :commentable
	has_many :rates, :as => :rateable
	has_many :links, :as => :linkable
	belongs_to :user
	scope :top5,
    select("books.id, books.title, count(likes.id) AS likes_count").joins(:likes).group("books.id").order("likes_count DESC").limit(5)
    scope :newest5,
    select("books.*").order("created_at desc").limit(3)
end
