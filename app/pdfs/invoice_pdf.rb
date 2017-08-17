
class InvoicePdf < Prawn::Document

  def initialize(invoice)
    super(top_margin: 70)



    text "Name"
    text "Address"
    text "Phone"
    text "Person To Contact"
    text "Date"


    text invoice.merchant.merchant_name


  end

end