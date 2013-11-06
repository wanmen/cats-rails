class AddCoverToXevents < ActiveRecord::Migration
  def change
    add_column :xevents, :cover, :string
  end
end
