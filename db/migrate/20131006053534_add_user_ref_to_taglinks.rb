class AddUserRefToTaglinks < ActiveRecord::Migration
  def change
    add_reference :taglinks, :user, index: true
  end
end
