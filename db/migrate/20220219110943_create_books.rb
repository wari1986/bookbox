class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :condition
      t.string :location
      t.string :cover
      t.string :title
      t.string :author
      t.string :category
      t.integer :year
      t.text :description
      t.string :language
      t.string :credit_worth
      t.string :displayed
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
