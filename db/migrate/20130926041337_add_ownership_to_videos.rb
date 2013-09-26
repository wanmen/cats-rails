class AddOwnershipToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :ownership, :integer,   default: 1
  end
end
