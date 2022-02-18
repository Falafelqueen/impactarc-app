class AddAttributesToOrganisation < ActiveRecord::Migration[7.0]
  def change
    add_column :organisations, :name, :string
    add_column :organisations, :subheading, :text
    add_column :organisations, :description, :text
  end
end
