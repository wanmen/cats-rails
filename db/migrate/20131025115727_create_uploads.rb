class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :file
      t.references :user, index: true
      t.timestamps
    end
  end
end
