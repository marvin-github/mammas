class Invoice < ApplicationRecord
  belongs_to :merchant
  belongs_to :user
  validates :merchant, presence: {message: "Must select merchant"}
  validates :debit, numericality: { message: "%{value} seems wrong" }, allow_nil: true
  validates :credit, numericality: { message: "%{value} seems wrong" }, allow_nil: true
  validates :quantity, numericality: { message: "%{value} seems wrong" }, allow_nil: true

end
