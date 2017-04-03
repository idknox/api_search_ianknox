class CreateRecentSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :recent_searches do |t|
      t.string :keyword, null: false
      t.integer :search_count, null: false, default: 0
      t.timestamps
    end
  end
end
