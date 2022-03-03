class AddSizeToOrganisations < ActiveRecord::Migration[7.0]
  def change
    add_column :organisations, :size, :string
  end
end
