
class SmallInvoicePdf < Prawn::Document

  def initialize(invoice)
    super(top_margin: 70)
    font_size = 6
    account_type = invoice.merchant.account_type
    time = Time.now.to_s

    invoice.invoice_items.each do |i|
      if  i.item.upc.include? "743010"
        text "La Mexicana Tortilla Factory",  :size => 6
        text "Wholesale Division",  :size => 6
        text "Billing Remittance:",  :size => 6

        text "111 E. 4 Street",  :size => 6
        text "Grand Island, NE 68801",  :size => 6
        text "Phone 308-390-0180",  :size => 6
        text DateTime.parse(time).strftime("%m/%d/%Y %H:%M:%S"),  :size => 6
        move_down 15
        break
      end
      if account_type == 0 #items that start with a 3 use this heading
        text "Mi Mama's Tortillas, LLC",  :size => 6
        text "Manufactures of Mi Mama's Tortillas and Baja Wraps",  :size => 6
        text "Billing Remittance:",  :size => 6

        text "828 S. 17th Street",  :size => 6
        text "Omaha, NE 68108",  :size => 6
        text "Orders: Phone(402) 345-2099 Fax (402) 345-1059",  :size => 6
        text "Billing Questions Phone (402) 345-2099",  :size => 6
        text DateTime.parse(time).strftime("%m/%d/%Y %H:%M:%S"),  :size => 6
        move_down 15
        break
      end
      if account_type == 1
        text "Mimick Distributing Incorporated",  :size => 6

        text "4001 N 211 Street",  :size => 6
        text "Elkhorn, NE 68022",  :size => 6
        text "(402) 871-7831",  :size => 6
        text "mimickdistributing@hotmail.com",  :size => 6
        text DateTime.parse(time).strftime("%m/%d/%Y %H:%M:%S"),  :size => 6
        move_down 15
        break
      end
    end
    text "___________________________________________________", :size => 6
    text_box "Invoice Number:", :at => [0, y - 40], :size => 6
    text_box  invoice.id.to_s, :at => [70, y - 40], :size => 6
    move_down 10

    text_box "Customer Account No:", :at => [0, y - 40], :size => 6
    text_box  invoice.merchant.store_number,:at => [70, y - 40], :size => 6
    move_down 10

    text_box "Name:", :at => [0, y - 40], :size => 6
    text_box invoice.merchant.merchant_name,:at => [70, y - 40], :size => 6
    move_down 10

    text_box "Billing Address:",:at => [0, y - 40], :size => 6
    text_box invoice.merchant.address1, :at => [70, y - 40], :size => 6
    move_down 10

    text_box "City:",:at => [0, y - 40], :size => 6
    text_box invoice.merchant.city, :at => [70, y - 40], :size => 6
    move_down 10

    text_box "Phone:",:at => [0, y - 40], :size => 6
    text_box invoice.merchant.phone, :at => [70, y - 40], :size => 6
    move_down 10

    text_box "Date:",:at => [0, y - 40], :size => 6
    text_box invoice.start_date.strftime("%m-%d-%Y"), :at => [70, y - 40], :size => 6

    move_down 30
    cash = 0.0
    total = 0.0
    credit = 0.0
    quantity_total = 0


    #text 'UPC' + '  |  ' +   'Description' + '  |  '  + 'Quantity' + '  |  ' + 'Cost', :style => :bold
    text_box "UPC",      :at => [0, y - 40], :size => 6
    text_box "Description",   :at => [45, y - 40], :size => 6
    #text_box "Package Counts",   :at => [200, y - 40], :size => 6
    text_box "Quantity",   :at => [125, y - 40], :size => 6
    #text_box "Cost",   :at => [350, y - 40], :size => 6
    text_box "Cost",   :at => [150, y - 40], :size => 6
    move_down 25

    invoice.invoice_items.each do |i|
      #text i.item.upc + '  |  ' +   i.item.description  + '  |  '  + i.quantity.to_s + '  |  ' + sprintf('%.2f',i.item.unit_cost).to_s
      text_box i.item.upc,      :at => [0, y - 40], :size => 6
      text_box i.item.description,   :at => [45, y - 40], :size => 6
      #text_box i.item.package_counts,   :at => [200, y - 40], :size => 6
      text_box i.quantity.to_s,   :at => [125, y - 40], :size => 6
      quantity_total += i.quantity
      if i.discounted_item == '*'
        discounted_item_cost =  i.item.unit_cost - i.item.discount_amount
        #text_box "$"+ sprintf('%.2f',discounted_item_cost.to_s) + "*",   :at => [350, y - 40], :size => 6
        text_box "$"+ sprintf('%.2f',discounted_item_cost * i.quantity).to_s,   :at => [150, y - 40], :size => 6
        total += discounted_item_cost * i.quantity
        cash += discounted_item_cost * i.quantity
      else
        #text_box "$"+ sprintf('%.2f',i.item.unit_cost).to_s,   :at => [350, y - 40], :size => 6
        text_box "$"+ sprintf('%.2f',i.item.unit_cost * i.quantity).to_s,   :at => [150, y - 40], :size => 6
        total += i.item.unit_cost * i.quantity
        cash += i.item.unit_cost * i.quantity
      end
      move_down 10

    end
    move_down 30
    draw_text "Grand Total",   :at => [0, y - 40], :size => 6
    draw_text quantity_total.to_s,   :at => [125, y - 40], :size => 6
    #draw_text "Total",:at => [350, y - 40], :size => 6
    draw_text "$" + sprintf('%.2f',cash).to_s,:at => [150, y - 40], :size => 6
    move_down 60


    text "Received By _______________________________________", :size => 6

    #stroke_axis


  end

end