class CreateXevents < ActiveRecord::Migration
  def change
    create_table :xevents do |t|
      t.belongs_to :xclub
      t.string :title
      t.text :content
      t.text :summary
      t.string :location
      t.datetime :time

      t.timestamps
    end
  end
end
