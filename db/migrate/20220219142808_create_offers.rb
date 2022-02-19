class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :offer_type
      t.string :status
      t.string :pickup_location
      t.float :latitude
      t.float :longitud
      t.date :pickup_date
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
