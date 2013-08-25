class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.references :list, index: true
      t.references :linkable, index: true, polymorphic: true

      t.timestamps
    end
  end
end
