
class InvoicePdf < Prawn::Document

  def initialize(invoice)
    super(top_margin: 70)
    font_size = 12
    account_type = invoice.merchant.account_type
    time = Time.now.to_s

    invoice.invoice_items.each do |i|
      if  i.item.upc.include? "743010"
        text "La Mexicana Tortilla Factory", :align => :center, :size=> 12
        text "Wholesale Division", :align => :center, :size=> 12
        text "Billing Remittance:", :align => :center, :size=> 12

        text "111 E. 4 Street", :align => :center, :size=> 12
        text "Grand Island, NE 68801", :align => :center, :size=> 12
        text "Phone 308-390-0180", :align => :center, :size=> 12
        text DateTime.parse(time).strftime("%m/%d/%Y %H:%M:%S"), :align => :center, :size=> 12
        text "_" * 80
        move_down 15
        break
      end
      if account_type == 0 #items that start with a 3 use this heading
        text "Mi Mama's Tortillas, LLC", :align => :center, :size=> 12
        text "Manufactures of Mi Mama's Tortillas and Baja Wraps", :align => :center, :size=> 12
        text "Billing Remittance:", :align => :center, :size=> 12

        text "828 S. 17th Street", :align => :center, :size=> 12
        text "Omaha, NE 68108", :align => :center, :size=> 12
        text "Orders: Phone(402) 345-2099 Fax (402) 345-1059", :align => :center, :size=> 12
        text "Billing Questions Phone (402) 345-2099", :align => :center, :size=> 12
        text DateTime.parse(time).strftime("%m/%d/%Y %H:%M:%S"), :align => :center, :size=> 12
        text "_" * 80
        move_down 15
        break
      end
      if account_type == 1
        text "Mimick Distributing Incorporated", :align => :center, :size=> 12

        text "4001 N 211 Street", :align => :center, :size=> 12
        text "Elkhorn, NE 68022", :align => :center, :size=> 12
        text "(402) 871-7831", :align => :center, :size=> 12
        text "mimickdistributing@hotmail.com", :align => :center, :size=> 12
        text DateTime.parse(time).strftime("%m/%d/%Y %H:%M:%S"), :align => :center, :size=> 12
        text "_" * 80
        move_down 15
        break
      end
    end
    text_box "Invoice Number:", :at => [0, y - 40], :size=> 12
    text_box  invoice.id.to_s, :at => [130, y - 40], :size=> 12
    move_down 10

    text_box "Customer Account No:", :at => [0, y - 40], :size=> 12
    text_box  invoice.merchant.store_number,:at => [130, y - 40], :size=> 12
    move_down 10

    text_box "Name:", :at => [0, y - 40], :size=> 12
    text_box invoice.merchant.merchant_name,:at => [130, y - 40], :size=> 12
    move_down 10

    text_box "Billing Address:",:at => [0, y - 40], :size=> 12
    text_box invoice.merchant.address1, :at => [130, y - 40], :size=> 12
    move_down 10

    text_box "City:",:at => [0, y - 40], :size=> 12
    text_box invoice.merchant.city, :at => [130, y - 40], :size=> 12
    move_down 10

    text_box "Phone:",:at => [0, y - 40], :size=> 12
    text_box invoice.merchant.phone, :at => [130, y - 40], :size=> 12
    move_down 10

    text_box "Date:",:at => [0, y - 40], :size=> 12
    text_box invoice.start_date.strftime("%m-%d-%Y"), :at => [130, y - 40], :size=> 12

    move_down 30
    text 'Detail', :align => :center, :style => :bold, :size=> 12
    move_down 10
    cash = 0.0
    total = 0.0
    credit = 0.0
    quantity_total = 0


    #text 'UPC' + '  |  ' +   'Description' + '  |  '  + 'Quantity' + '  |  ' + 'Cost', :style => :bold
    text_box "UPC",      :at => [0, y - 40], :size=> 12
    text_box "Description",   :at => [65, y - 40], :size=> 12
    text_box "Package Counts",   :at => [200, y - 40], :size=> 12
    text_box "Quantity",   :at => [300, y - 40], :size=> 12
    text_box "Cost",   :at => [350, y - 40], :size=> 12
    text_box "Extended Price",   :at => [400, y - 40], :size=> 12
    move_down 25

    invoice.invoice_items.each do |i|
      #text i.item.upc + '  |  ' +   i.item.description  + '  |  '  + i.quantity.to_s + '  |  ' + sprintf('%.2f',i.item.unit_cost).to_s
      text_box i.item.upc,      :at => [0, y - 40], :size=> 12
      text_box i.item.description,   :at => [65, y - 40], :size=> 12
      text_box i.item.package_counts,   :at => [200, y - 40], :size=> 12
      text_box i.quantity.to_s,   :at => [300, y - 40], :size=> 12
      quantity_total += i.quantity
      if i.discounted_item == '*'
        discounted_item_cost =  i.item.unit_cost - i.item.discount_amount
        text_box "$"+ sprintf('%.2f',discounted_item_cost.to_s) + "*",   :at => [350, y - 40], :size=> 12
        text_box "$"+ sprintf('%.2f',discounted_item_cost * i.quantity).to_s,   :at => [400, y - 40], :size=> 12
        total += discounted_item_cost * i.quantity
        cash += discounted_item_cost * i.quantity
      else
        text_box "$"+ sprintf('%.2f',i.item.unit_cost).to_s,   :at => [350, y - 40], :size=> 12
        text_box "$"+ sprintf('%.2f',i.item.unit_cost * i.quantity).to_s,   :at => [400, y - 40], :size=> 12
        total += i.item.unit_cost * i.quantity
        cash += i.item.unit_cost * i.quantity
      end
      move_down 10

    end
    move_down 30
    draw_text "Total",   :at => [200, y - 40], :size=> 12
    draw_text quantity_total.to_s,   :at => [300, y - 40], :size=> 12
    #draw_text "Total",:at => [350, y - 40], :size=> 12
    draw_text "$" + sprintf('%.2f',cash).to_s,:at => [400, y - 40], :size=> 12
    move_down 40


    text "Received By _______________________________________", :size=> 12

    #stroke_axis


  end

end