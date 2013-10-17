class CreateXmembers < ActiveRecord::Migration
  def change
    create_table :xmembers do |t|
      t.belongs_to :xclub
      t.belongs_to :user
      t.string :role

      t.timestamps
    end
  end
end
