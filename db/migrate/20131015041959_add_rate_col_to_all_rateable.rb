class AddRateColToAllRateable < ActiveRecord::Migration
  def change
  	add_column :articles, :rate, :float, default: 0.0
  	add_column :books, :rate, :float, default: 0.0
  	add_column :lists, :rate, :float, default: 0.0
  	add_column :videos, :rate, :float, default: 0.0
  end
end
