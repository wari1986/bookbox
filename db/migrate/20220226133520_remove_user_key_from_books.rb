class RemoveUserKeyFromBooks < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :books, :users
    remove_column :books, :user_id
  end
end
