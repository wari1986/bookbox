class AddOwnedToUserBookRelationships < ActiveRecord::Migration[6.0]
  def change
    add_column :user_book_relationships, :owned, :boolean, default: false
  end
end
