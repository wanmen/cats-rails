class RemoveOrderNumFromLink < ActiveRecord::Migration
  def change
  	remove_column :links, :order_num
  end
end
