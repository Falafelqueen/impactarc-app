class AddReferencesToOrganisationCategory < ActiveRecord::Migration[7.0]
  def change
    add_reference :organisation_categories, :organisation, foreign_key: true
    add_reference :organisation_categories, :category, foreign_key: true
  end
end
