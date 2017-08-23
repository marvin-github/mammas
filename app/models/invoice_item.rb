class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :item
  validates :quantity, numericality: { message: "%{value} seems wrong" }, allow_nil: true
end
