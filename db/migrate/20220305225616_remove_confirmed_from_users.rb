class RemoveConfirmedFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :confirmed, :boolean
  end
end
