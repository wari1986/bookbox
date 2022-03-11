class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_book_relationships
  has_many :books, through: :user_book_relationships
  has_many :incoming_swaps, class_name: 'Swap', foreign_key: :user_id
  has_many :requested_swaps, class_name: 'Swap', foreign_key: :swapper_id
end
