class AddSwapReferenceToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :swap, index: true
  end
end
