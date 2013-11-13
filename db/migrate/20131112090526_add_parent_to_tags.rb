class AddParentToTags < ActiveRecord::Migration
  def change
    add_column :tags, :parent, :integer, default: -1
  end
end
