class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :cover
      t.text :summary
      t.string :url
      t.string :lecturer

      t.timestamps
    end
  end
end
