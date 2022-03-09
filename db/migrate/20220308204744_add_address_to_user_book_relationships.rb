class AddAddressToUserBookRelationships < ActiveRecord::Migration[6.0]
  def change
    add_column :user_book_relationships, :address, :string
  end
end
