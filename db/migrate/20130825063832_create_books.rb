class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :dbid
      t.string :cover
      t.text :summary
      t.string :isbn
      t.string :author
      t.string :publisher
      t.string :url

      t.timestamps
    end
  end
end
