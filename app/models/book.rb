class Book < ApplicationRecord
  belongs_to :user

  validates :title, :cover, :location, :condition, :category, :year, :author, :description, :language, presence: true

end
