class RemoveCategoriesFromOrganisation < ActiveRecord::Migration[7.0]
  def change
    remove_column :organisations, :categories
  end
end
