class Article < ActiveRecord::Base
	has_many :likes, :as => :likeable, dependent: :destroy
	has_many :taglinks, :as => :tagable, dependent: :destroy
	has_many :rates, :as => :rateable, dependent: :destroy
	has_many :comments, :as => :commentable, dependent: :destroy
	has_many :links, :as => :linkable, dependent: :destroy
	belongs_to :user
  scope :best6, ->{ select("articles.id, articles.title, articles.summary, articles.user_id, articles.updated_at, articles.rate").group("articles.id").order("articles.rate DESC").limit(6)}
  scope :newest10, ->{ select("articles.id,articles.title").order("created_at desc").limit(10)}
end
