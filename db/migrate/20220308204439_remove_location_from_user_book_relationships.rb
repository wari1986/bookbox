class RemoveLocationFromUserBookRelationships < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_book_relationships, :location, :string
  end
end
