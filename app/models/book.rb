class Book < ActiveRecord::Base
	has_many :tags, :as => :tagable
	has_many :likes, :as => :likeable
	has_many :comments, :as => :commentable
	has_many :rates, :as => :rateable
end
