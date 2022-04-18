class AddUnsolicitedToOrganisation < ActiveRecord::Migration[7.0]
  def change
    add_column :organisations, :unsolicited, :boolean
  end
end
