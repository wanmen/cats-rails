class CreateXclubs < ActiveRecord::Migration
  def change
    create_table :xclubs do |t|
      t.string :name
      t.date :started
      t.text :summary
      t.string :thumbnail

      t.timestamps
    end
  end
end
