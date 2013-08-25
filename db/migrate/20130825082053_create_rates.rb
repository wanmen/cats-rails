class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.references :user, index: true
      t.references :rateable, index: true, polymorphic: true
      t.integer :star

      t.timestamps
    end
  end
end
