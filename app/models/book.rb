class Book < ApplicationRecord
  has_many :user_book_relationships
  has_many :users, through: :user_book_relationships
  has_many :reviews

  #validates :title, :cover, :location, :condition, :category, :year, :author, :description, :language, presence: true
end
