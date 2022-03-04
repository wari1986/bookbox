class AddCoordinatesToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :latitude, :float
    add_column :books, :longitude, :float
  end
end
