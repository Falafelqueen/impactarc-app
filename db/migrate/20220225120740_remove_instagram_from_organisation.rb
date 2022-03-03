class RemoveInstagramFromOrganisation < ActiveRecord::Migration[7.0]
  def change
    remove_column :organisations, :instagram
    add_column :organisations, :website, :string
  end
end
