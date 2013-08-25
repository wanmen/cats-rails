class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title
      t.text :summary
      t.references :admin, index: true

      t.timestamps
    end
  end
end
