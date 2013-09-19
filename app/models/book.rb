class Book < ActiveRecord::Base
	has_many :taglinks, :as => :tagable
	has_many :likes, :as => :likeable
	has_many :comments, :as => :commentable
	has_many :rates, :as => :rateable
	has_many :links, :as => :linkable
	belongs_to :user
	scope :top10, -> { select("books.id, books.title, count(likes.id) AS likes_count").joins(:likes).group("books.id").order("likes_count DESC").limit(10)}
	scope :newest6, ->{ select("books.id,books.title,books.cover").order("created_at desc").limit(6)}
    scope :best6, ->{ select("books.id, books.title, books.cover, count(rates.id) AS rates_count").joins(:rates).group("books.id").order("rates_count DESC").limit(6)}
end
