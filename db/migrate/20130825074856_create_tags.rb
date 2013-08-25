class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.references :topic, index: true
      t.references :tagable, index: true, polymorphic: true

      t.timestamps
    end
  end
end
