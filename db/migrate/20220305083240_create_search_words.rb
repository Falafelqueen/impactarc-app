class CreateSearchWords < ActiveRecord::Migration[7.0]
  def change
    create_table :search_words do |t|
      t.string :search_word

      t.timestamps
    end
  end
end
