class List < ActiveRecord::Base
  belongs_to :user
  has_many :taglinks, :as => :tagable
  has_many :likes, :as => :likeable
  has_many :comments, :as => :commentable
  has_many :rates, :as => :rateable
  has_many :links
  scope :top10Booklist,
  select("lists.id, lists.title, count(likes.id) AS likes_count").where(list_type: 1).joins(:likes).group("lists.id").order("likes_count DESC").limit(10)
  scope :newest3Booklist,
  select("lists.id, lists.title").where(list_type: 1).order("created_at desc").limit(3)
  scope :top10Videolist,
  select("lists.id, lists.title, count(likes.id) AS likes_count").where(list_type: 2).joins(:likes).group("lists.id").order("likes_count DESC").limit(10)
  scope :newest6Videolist,
  select("lists.id, lists.title").where(list_type: 2).order("created_at desc").limit(6)
end
