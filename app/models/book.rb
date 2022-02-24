class Book < ApplicationRecord
  belongs_to :user
  has_many :books
  validates :title, :cover, :location, :condition, :category, :year, :author, :description, :language, presence: true
end
