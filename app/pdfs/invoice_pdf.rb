
class InvoicePdf < Prawn::Document

  def initialize(invoice)
    super(top_margin: 70)
    puts '*********'
    puts invoice.merchant.merchant_name
text invoice.merchant.merchant_name


  end

end