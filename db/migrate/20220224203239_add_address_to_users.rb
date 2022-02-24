class AddAddressToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :address_number, :integer
    add_column :users, :address_city, :string
    add_column :users, :address_street, :string
    remove_column  :users, :zip_code
  end
end
