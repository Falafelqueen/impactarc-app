class CreateUserOrganisations < ActiveRecord::Migration[7.0]
  def change
    create_table :user_organisations do |t|
      t.string :comment

      t.timestamps
    end
  end
end
