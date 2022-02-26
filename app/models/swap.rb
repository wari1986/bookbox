class Swap < ApplicationRecord
  belongs_to :user
  belongs_to :book
  belongs_to :swapper, class_name: 'User', foreign_key: :swapper_id
  belongs_to :swapped_book, class_name: 'Book', foreign_key: :swapped_book_id
end
