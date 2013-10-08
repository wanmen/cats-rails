class List < ActiveRecord::Base
  belongs_to :user
  has_many :taglinks, :as => :tagable, dependent: :destroy
  has_many :likes, :as => :likeable, dependent: :destroy
  has_many :comments, :as => :commentable, dependent: :destroy
  has_many :rates, :as => :rateable, dependent: :destroy
  has_many :links, dependent: :destroy
  serialize :links_array, Array
  scope :top10Booklist,->{select("lists.id, lists.title, count(likes.id) AS likes_count").where(list_type: 1).joins(:likes).group("lists.id").order("likes_count DESC").limit(10)}
  scope :newest3Booklist,->{select("lists.id, lists.title").where(list_type: 1).order("created_at desc").limit(3)}
  scope :top10Videolist,->{select("lists.id, lists.title, count(likes.id) AS likes_count").where(list_type: 2).joins(:likes).group("lists.id").order("likes_count DESC").limit(10)}
  scope :newest6Videolist,->{select("lists.id, lists.title").where(list_type: 2).order("created_at desc").limit(6)}
  scope :best6Booklist,->{select("lists.id, lists.title, count(rates.id) AS rates_count").where(list_type: 1).joins(:rates).group("lists.id").order("rates_count DESC").limit(6)}
  scope :best6Videolist,->{select("lists.id, lists.title, count(rates.id) AS rates_count").where(list_type: 2).joins(:rates).group("lists.id").order("rates_count DESC").limit(6)}
end
