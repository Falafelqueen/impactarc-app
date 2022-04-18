class AddMainToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :main, :boolean
  end
end
