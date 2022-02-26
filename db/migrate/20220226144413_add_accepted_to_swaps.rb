class AddAcceptedToSwaps < ActiveRecord::Migration[6.0]
  def change
    add_column :swaps, :accepted, :Boolean, default: false
  end
end
