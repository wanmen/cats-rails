class Addindextotags < ActiveRecord::Migration
  def change
  	add_index :follows, [:followable_id, :followable_type,:user_id], :unique => true
  	add_index :likes, [:likeable_id, :likeable_type]
  	add_index :comments, [:commentable_id, :commentable_type]
  	add_index :tags, [:tagable_id, :tagable_type]
  end
end
