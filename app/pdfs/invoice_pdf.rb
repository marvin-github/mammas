
class InvoicePdf < Prawn::Document

  def initialize(invoice)
    super(top_margin: 70)
    font_size = 11
    account_type = invoice.merchant.account_type
    time = Time.now.to_s

    invoice.invoice_items.each do |i|
      if  i.item.upc.include? "743010"
        text "La Mexicana Tortilla Factory", :align => :center, :size => 11
        text "Wholesale Division", :align => :center, :size => 11
        text "Billing Remittance:", :align => :center, :size => 11

        text "111 E. 4 Street", :align => :center, :size => 11
        text "Grand Island, NE 68801", :align => :center, :size => 11
        text "Phone 308-390-0180", :align => :center, :size => 11
        text DateTime.parse(time).strftime("%m/%d/%Y %H:%M:%S"), :align => :center, :size => 11
        text "_" * 80
        move_down 15
        break
      end
      if account_type == 0 #items that start with a 3 use this heading
        text "Mi Mama's Tortillas, LLC", :align => :center, :size => 11
        text "Manufactures of Mi Mama's Tortillas and Baja Wraps", :align => :center, :size => 11
        text "Billing Remittance:", :align => :center, :size => 11

        text "828 S. 17th Street", :align => :center, :size => 11
        text "Omaha, NE 68108", :align => :center, :size => 11
        text "Orders: Phone(402) 345-2099 Fax (402) 345-1059", :align => :center, :size => 11
        text "Billing Questions Phone (402) 345-2099", :align => :center, :size => 11
        text DateTime.parse(time).strftime("%m/%d/%Y %H:%M:%S"), :align => :center, :size => 11
        text "_" * 80
        move_down 15
        break
      end
      if account_type == 1
        text "Mimick Distributing Incorporated", :align => :center, :size => 11

        text "16017 Weber Street", :align => :center, :size => 11
        text "Bennington, NE 68007", :align => :center, :size => 11
        text "(402) 871-7831", :align => :center, :size => 11
        text "mimickdistributing@hotmail.com", :align => :center, :size => 11
        text DateTime.parse(time).strftime("%m/%d/%Y %H:%M:%S"), :align => :center, :size => 11
        text "_" * 80
        move_down 15
        break
      end
      if account_type == 9
        text "Mimick Distributing Incorporated", :align => :center, :size => 11

        text "16017 Weber Street", :align => :center, :size => 11
        text "Bennington, NE 68007", :align => :center, :size => 11
        text "(402) 871-7831", :align => :center, :size => 11
        text "mimickdistributing@hotmail.com", :align => :center, :size => 11
        text DateTime.parse(time).strftime("%m/%d/%Y %H:%M:%S"), :align => :center, :size => 11
        text "_" * 80
        move_down 15
        break
      end
    end
    text_box "Invoice Number:", :at => [0, y - 40], :size => 11
    text_box  invoice.id.to_s, :at => [145, y - 40], :size => 11
    move_down 15

    text_box "Customer Acct #:", :at => [0, y - 40], :size => 11
    text_box  invoice.merchant.store_number,:at => [145, y - 40], :size => 11
    move_down 15

    text_box "Name:", :at => [0, y - 40], :size => 11
    text_box invoice.merchant.merchant_name,:at => [145, y - 40], :size => 11
    move_down 15

    text_box "Billing Address:",:at => [0, y - 40], :size => 11
    text_box invoice.merchant.address1, :at => [145, y - 40], :size => 11
    move_down 15

    text_box "City:",:at => [0, y - 40], :size => 11
    text_box invoice.merchant.city, :at => [145, y - 40], :size => 11
    move_down 15

    text_box "Phone:",:at => [0, y - 40], :size => 11
    text_box invoice.merchant.phone, :at => [145, y - 40], :size => 11
    move_down 15

    text_box "Date:",:at => [0, y - 40], :size => 11
    text_box invoice.start_date.strftime("%m-%d-%Y"), :at => [145, y - 40], :size => 11

    move_down 30
    text 'Detail', :align => :center, :style => :bold, :size => 11
    move_down 10
    cash = 0.0
    total = 0.0
    credit = 0.0
    quantity_total = 0


    #text 'UPC' + '  |  ' +   'Description' + '  |  '  + 'Quantity' + '  |  ' + 'Cost', :style => :bold
    text_box "UPC",      :at => [0, y - 40], :size => 11
    text_box "Description",   :at => [75, y - 40], :size => 11
    text_box "Package Counts",   :at => [230, y - 40], :size => 11
    text_box "Qty",   :at => [330, y - 40], :size => 11
    text_box "Cost",   :at => [370, y - 40], :size => 11
    text_box "Ext Price",   :at => [425, y - 40], :size => 11
    move_down 25

    invoice.invoice_items.each do |i|
      #text i.item.upc + '  |  ' +   i.item.description  + '  |  '  + i.quantity.to_s + '  |  ' + sprintf('%.2f',i.item.unit_cost).to_s
      text_box i.item.upc,      :at => [0, y - 40], :size => 11
      text_box i.item.description,   :at => [75, y - 40], :size => 11
      text_box i.item.package_counts,   :at => [230, y - 40], :size => 11
      text_box i.quantity.to_s,   :at => [330, y - 40], :size => 11
      quantity_total += i.quantity
      if i.discounted_item == '*'
        discounted_item_cost =  i.item.unit_cost - i.item.discount_amount
        text_box "$"+ sprintf('%.2f',discounted_item_cost.to_s) + "*",   :at => [370, y - 40], :size => 11
        text_box "$"+ sprintf('%.2f',discounted_item_cost * i.quantity).to_s,   :at => [425, y - 40], :size => 11
        total += discounted_item_cost * i.quantity
        cash += discounted_item_cost * i.quantity
      else
        text_box "$"+ sprintf('%.2f',i.item.unit_cost).to_s,   :at => [370, y - 40], :size => 11
        text_box "$"+ sprintf('%.2f',i.item.unit_cost * i.quantity).to_s,   :at => [425, y - 40], :size => 11
        total += i.item.unit_cost * i.quantity
        cash += i.item.unit_cost * i.quantity
      end
      move_down 10

    end
    move_down 50
    draw_text "Total",   :at => [230, y - 40], :size => 11
    draw_text quantity_total.to_s,   :at => [330, y - 40], :size => 11
    #draw_text "Total",:at => [350, y - 40], :size => 11
    draw_text "$" + sprintf('%.2f',cash).to_s,:at => [425, y - 40], :size => 11
    move_down 40


    text "Received By _______________________________________", :size => 11

    #stroke_axis


  end

end