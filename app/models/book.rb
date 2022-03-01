class Book < ApplicationRecord
  has_many :user_book_relationships, dependent: :destroy

  has_many :users, through: :user_book_relationships, dependent: :destroy

  has_many :reviews, dependent: :destroy

  has_many :swaps, dependent: :destroy

  validates :title, :cover, :condition, :author, presence: true
  #validates :title, :cover, :location, :condition, :category, :year, :author, :description, :language, presence: true
end
