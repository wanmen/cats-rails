class AddTypeToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :type, :integer, :default => 1
  end
end
