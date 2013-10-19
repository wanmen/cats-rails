class AddPopularityToEntities < ActiveRecord::Migration
  def change
  	add_column :articles, :popularity, :integer, default: 0
  	add_column :books, :popularity, :integer, default: 0
  	add_column :lists, :popularity, :integer, default: 0
  	add_column :videos, :popularity, :integer, default: 0
  end
end
