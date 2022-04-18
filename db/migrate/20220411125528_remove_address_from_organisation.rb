class RemoveAddressFromOrganisation < ActiveRecord::Migration[7.0]
  def change
    remove_column :organisations, :address
    add_column :organisations,:street, :string
    add_column :organisations,:city, :string
    add_column :organisations,:country, :string
    add_column :organisations,:zip, :string
  end
end
