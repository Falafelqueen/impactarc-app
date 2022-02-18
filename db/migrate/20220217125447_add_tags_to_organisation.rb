class AddTagsToOrganisation < ActiveRecord::Migration[7.0]
  def change
    add_column :organisations, :tags, :string, array: true
    add_column :organisations, :categories, :string, array: true
    add_column :organisations, :address, :string
    add_column :organisations, :email, :string
    add_column :organisations, :phone, :string
    add_column :organisations, :linkedin, :string
    add_column :organisations, :facebook, :string
    add_column :organisations, :instagram, :string
    add_column :organisations, :english, :boolean
    add_column :organisations, :internship, :boolean
    add_column :organisations, :volunteering, :boolean
  end
end
