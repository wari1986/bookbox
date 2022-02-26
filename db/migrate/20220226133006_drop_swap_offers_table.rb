class DropSwapOffersTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :swap_offers
  end
end
