class AddCoordinatesToUserBookRelationships < ActiveRecord::Migration[6.0]
  def change
    add_column :user_book_relationships, :latitude, :float
    add_column :user_book_relationships, :longitude, :float
  end
end
