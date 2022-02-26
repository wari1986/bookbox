class Book < ApplicationRecord
  belongs_to :user
  has_many :books
  validates :title, :cover, :location, :condition, :category, :year, :author, :description, :language, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
