class RemoveTagReferences < ActiveRecord::Migration[7.0]
  def change
    remove_column :organisations, :tags_id
    remove_column :search_words, :tags_id
  end
end
