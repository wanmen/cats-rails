class Addindextolikes < ActiveRecord::Migration
  def change
  	add_index :likes, [:likeable_id, :likeable_type,:user_id], :unique => true
  	add_index :rates, [:rateable_id, :rateable_type,:user_id], :unique => true
  end
end
