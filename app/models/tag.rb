class Tag < ActiveRecord::Base
	has_many :likes, :as => :likeable
	has_many :follows, :as => :followable
	has_many :taglinks
    scope :top20,->{select("tags.id, tags.name, count(likes.id) AS likes_count").joins(:likes).group("tags.id").order("likes_count DESC").limit(20)}
end
