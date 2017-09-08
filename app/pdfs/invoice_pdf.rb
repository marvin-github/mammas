
class InvoicePdf < Prawn::Document

  def initialize(invoice)
    super(top_margin: 70)

    invoice.invoice_items.each do |i|
      if  i.item.upc.include? "743010"
        text "La Mexicana Tortilla Factory", :align => :center
        text "Wholesale Division", :align => :center
        text "Billing Remittance:", :align => :center

        text "111 E. 4 Street", :align => :center
        text "Grand Island, NE 68801", :align => :center
        text "Phone 308-390-0180", :align => :center
        text "_" * 80
        move_down 30
        break
      end
      if i.item.upc[0] == '3'
        text "Mi Mama's Tortillas, LLC", :align => :center
        text "Manufactures of Mi Mama's Tortillas and Baja Wraps", :align => :center
        text "Billing Remittance:", :align => :center

        text "828 S. 17th Street", :align => :center
        text "Omaha, NE 68108", :align => :center
        text "Orders: Phone(402) 345-2099 Fax (402) 345-1059", :align => :center
        text "Billing Questions Phone (402) 345-2099", :align => :center
        text "_" * 80
        move_down 30
        break
      end
      if i.item.upc[0] == '6'
        text "Mimick Distributing Incorporated", :align => :center

        text "4001 N 211 Street", :align => :center
        text "Elkhorn, NE 68022", :align => :center
        text "(402) 871-7831", :align => :center
        text "mimickdistributing@hotmail.com", :align => :center
        text "_" * 80
        move_down 30
        break
      end
    end
    text_box "Invoice Number:", :at => [0, y - 40]
    text_box  invoice.id.to_s, :at => [130, y - 40]
    move_down 15

    text_box "Customer Account No:", :at => [0, y - 40]
    text_box  invoice.merchant.store_number,:at => [130, y - 40]
    move_down 15

    text_box "Name:", :at => [0, y - 40]
    text_box invoice.merchant.merchant_name,:at => [130, y - 40]
    move_down 15

    text_box "Billing Address:",:at => [0, y - 40]
    text_box invoice.merchant.address1, :at => [130, y - 40]
    move_down 15

    text_box "Phone:",:at => [0, y - 40]
    text_box invoice.merchant.phone, :at => [130, y - 40]
    move_down 15

    text_box "Date:",:at => [0, y - 40]
    text_box invoice.start_date.strftime("%m-%d-%Y"), :at => [130, y - 40]

    move_down 40
    text 'Detail', :align => :center, :style => :bold
    move_down 30
    cash = 0.0
    credit = 0.0
    total = 0.0

    #text 'UPC' + '  |  ' +   'Description' + '  |  '  + 'Quantity' + '  |  ' + 'Cost', :style => :bold
    text_box "UPC",      :at => [0, y - 40]
    text_box "Description",   :at => [100, y - 40]
    text_box "Quantity",   :at => [275, y - 40]
    text_box "Cost",   :at => [350, y - 40]
    text_box "Extended Price",   :at => [425, y - 40]
    move_down 25

    invoice.invoice_items.each do |i|
      #text i.item.upc + '  |  ' +   i.item.description  + '  |  '  + i.quantity.to_s + '  |  ' + sprintf('%.2f',i.item.unit_cost).to_s
      text_box i.item.upc,      :at => [0, y - 40]
      text_box i.item.description,   :at => [100, y - 40]
      text_box i.quantity.to_s,   :at => [275, y - 40]
      text_box "$"+ sprintf('%.2f',i.item.unit_cost).to_s,   :at => [350, y - 40]
      text_box "$"+ sprintf('%.2f',i.item.unit_cost * i.quantity).to_s,   :at => [425, y - 40]
      move_down 20

      total += i.item.unit_cost * i.quantity
      if i.quantity < 0
        credit += i.item.unit_cost * i.quantity
      else
        cash += i.item.unit_cost * i.quantity
      end
    end
    move_down 30

    draw_text "Cash Total    " + "$" + sprintf('%.2f',cash).to_s,:at => [350, y - 40]
    move_down 14
    draw_text "Credit Total   " + "$" + sprintf('%.2f',credit).to_s,:at => [350, y - 40]
    move_down 14
    draw_text "Grand Total   " + "$" + sprintf('%.2f',total).to_s,:at => [350, y - 40]
    move_down 30

    text "Received By _________________________________________________________"
    #stroke_axis


  end

end