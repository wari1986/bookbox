class SwapOffer < ApplicationRecord
  belongs_to :offer
  belongs_to :book

  validates :status, presence: true

end
