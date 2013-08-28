class Tag < ActiveRecord::Base
	has_many :likes, :as => :likeable
	has_many :follows, :as => :followable
end
