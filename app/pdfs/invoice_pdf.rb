
class InvoicePdf < Prawn::Document

  def initialize(invoice)
    super(top_margin: 70)


    text "Mi Mama's Tortillas, LLC", :align => :center
    text "Manufactures of Mi Mama's BAAA and", :align => :center
    text "other fine Mexican Food Products", :align => :center
    text "Billing Remittance:", :align => :center

    text "828 S. 17th Street", :align => :center
    text "Omaha, NE 68108", :align => :center
    text "Orders: Phone(402) 345-2099 Fax (402) 345-1059", :align => :center
    text "Billing Questions Phone (402) 345-2099", :align => :center
    text "_" * 80
    move_down 30
    text "Invoice Number:            "  + invoice.id.to_s
    text "Customer Account No:  " + invoice.merchant.store_number
    text "Billing Address:              " + invoice.merchant.address1
    text "Name:                           " + invoice.merchant.merchant_name
    text "Address:                       " + invoice.merchant.address1
    text "Phone:                          " + invoice.merchant.phone
    text "Date:                             " + invoice.start_date.strftime("%m-%d-%Y")
    text '_' * 80
    move_down 30
    total = 0.0
    invoice.invoice_items.each do |i|
      text i.item.upc + '  |  ' +   i.item.description  + '  |  '  +  '  |  ' + i.item.unit_cost.to_s
      total += i.item.unit_cost * i.quantity
    end
    move_down 30

    text "Grand Total  " + total.to_s

    move_down 30

    text "Received By _________________________________________________________"


  end

end