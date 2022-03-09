class AddLocationToUserBookRelationships < ActiveRecord::Migration[6.0]
  def change
    add_column :user_book_relationships, :location, :string
  end
end
