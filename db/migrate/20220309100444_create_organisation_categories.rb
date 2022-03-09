class CreateOrganisationCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :organisation_categories do |t|

      t.timestamps
    end
  end
end
