class AddLinkArrayToLists < ActiveRecord::Migration
  def change
    add_column :lists, :links_array, :text
  end
end
