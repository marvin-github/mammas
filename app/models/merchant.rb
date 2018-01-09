class Merchant < ApplicationRecord
  has_many :invoices
  validates :store_number, presence: {message: "Store number required"}
end
