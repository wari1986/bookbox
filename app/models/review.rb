class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :title, :stars, :content, presence: true
  validates :stars, numericality: { only_integer: true, less_than_or_equal_to: 5 }

end
