class AddTranslatorToBooks < ActiveRecord::Migration
  def change
    add_column :books, :translator, :string
  end
end
