class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :item
  validates :quantity, numericality: { only_integer: true, message: "%{value} seems wrong" }
end
