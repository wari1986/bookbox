class Offer < ApplicationRecord
  belongs_to :book

  validates :offer_type, :status, presence: true

end
