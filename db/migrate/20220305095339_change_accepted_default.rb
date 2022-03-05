class ChangeAcceptedDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:swaps, :accepted, nil)
  end
end
