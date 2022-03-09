class RemoveTagsFromOrganisation < ActiveRecord::Migration[7.0]
  def change
    remove_column :organisations, :tags
  end
end
