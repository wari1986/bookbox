class AddConfirmedToSwaps < ActiveRecord::Migration[6.0]
  def change
    add_column :swaps, :confirmed, :boolean
  end
end
