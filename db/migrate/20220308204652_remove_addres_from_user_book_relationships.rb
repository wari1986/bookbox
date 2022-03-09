class RemoveAddresFromUserBookRelationships < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_book_relationships, :addres, :string
  end
end
