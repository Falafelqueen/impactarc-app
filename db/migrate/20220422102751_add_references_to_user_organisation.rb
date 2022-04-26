class AddReferencesToUserOrganisation < ActiveRecord::Migration[7.0]
  def change
    add_reference :user_organisations, :user, foreign_kye: true
    add_reference :user_organisations, :organisation, foreign_kye: true
  end
end
