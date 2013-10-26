class AddCoverToLists < ActiveRecord::Migration
  def change
    add_column :lists, :cover, :string
  end
end
