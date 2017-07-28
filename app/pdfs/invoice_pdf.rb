class InvoicePdf < Prawn::Document
  def initialize(invoice)
    text_box invoice.merchant.merchant_name
  end
end