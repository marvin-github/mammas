
class InvoicePdf < Prawn::Document

  def initialize(invoice)
    super(top_margin: 70)


    text "Mi Mama's Tortillas, LLC"
    text "Manufactures of Mi Mama's BAAA and"
    text "other fine Mexican Food Products"
    text "Billing Remittance:"
    text "Invoice #"
    text "828 S. 17th Street"
    text "Omaha, NE 68108"
    text "Orders: Phone(402) 345-2099 Fax (402) 345-1059"
    text "Billing Questions Phone (402) 345-2099"
    text "Customer Account No"
    text "Billing Address"
    text "Name"
    text "Address"
    text "Phone"
    text "Person To Contact"
    text "Date"


    text invoice.merchant.merchant_name


  end

end