class AddReferencesToTags < ActiveRecord::Migration[7.0]
  def change
    add_reference :tags, :organisation, foreign_key: true
    add_reference :tags, :search_word, foreign_key: true
  end
end
