class CreateSwapOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :swap_offers do |t|
      t.string :status
      t.references :offer, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
