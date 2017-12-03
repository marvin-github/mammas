class InvoiceController < ApplicationController

  before_action :authorize

  def index
    @invoice = Invoice.all.order({ start_date: :desc })

  end

  def new
    puts 'zzz-invoice-controller-new'
    @account_type =  params[:account_type]
    puts @account_type
    @invoice = Invoice.new

    case @account_type
      when "0"
        @item = Item.where(mamas_item: true)
      when "1"
        @item = Item.where(mimick_item: true)
      when "7"
        @item = Item.where(mexicana_item: true)
    end


  end

  def show
    @invoice = Invoice.find(params[:id])


  end

  def create
    @invoice = Invoice.new(invoice_params)
    account_type = @invoice.merchant.account_type


    if params[:selections].blank?
      flash[:danger] = 'Must select at least one item'
      redirect_to :controller => 'invoice', :action => 'new' and return
    end

    @items = Item.find(params[:selections])
    @invoice.user_id = session[:user_id]
    puts 'mmmmmmmm'
    puts params[:invoice].fetch(:merchant_id)
    merchant = Merchant.find(params[:invoice].fetch(:merchant_id))
    puts 'ppppppp'
    puts merchant.inspect
    @invoice.account_type = merchant.account_type
    if @invoice.save
      flash[:notice] = "Invoice has been created"
      puts 'zzz-invoice_controller.create'
      puts params.inspect
      #use text input instead of checkboxes
      case account_type
        when 0
          item_list = Item.where(mamas_item: true)
        when 1
          item_list = Item.where(mimick_item: true)
        when 7
          item_list = Item.where(mexicana_item: true)
      end
      item_list.each do |i|
        if params['quantity' + i.id.to_s] == ""
          puts 'no quantity'
          puts 'quantity'+ i.id.to_s
        else
          puts 'yes quantity'
          puts 'quantity'+ i.id.to_s
        end
      end

      params[:selections].each do |i|
        item = Item.find(i)
        cart = InvoiceItem.new
        cart.invoice = @invoice
        cart.item = item
        cart.quantity = params['quantity' + i.to_s]

        if @invoice.merchant.discount == 'yes' and !item.discount_start_date.nil? and !item.discount_end_date.nil?
          range = item.discount_start_date.strftime("%Y-%m-%d")..item.discount_end_date.strftime("%Y-%m-%d")
          if range.include?(Time.now.strftime("%Y-%m-%d"))
            puts item.discount_amount
            discounted_item_cost =  item.unit_cost - item.discount_amount
            cart.cost = discounted_item_cost * cart.quantity
            cart.discounted_item = "*"
            cart
          else
            cart.cost = item.unit_cost * cart.quantity
          end
        else
          cart.cost = item.unit_cost * cart.quantity
        end
        @invoice.invoice_items << cart
      end

      if @invoice.save
        redirect_to @invoice
      else
        render 'new'
      end
    else
       render 'new'
    end
  end

  def update
    @invoice = Invoice.find(params[:id])
    @invoiceItems = Hash.new

    @invoice.invoice_items.each do |ii|
      @invoiceItems[ii.item_id] = ii.id
    end

    @invoice.user_id = session[:user_id]
    flash[:notice] = "Invoice has been updated"
    params[:selections].each do |i|
      item = Item.find(i)
      if @invoiceItems.member?(item.id)
        unless params['quantity' + i.to_s].blank?
          cart = InvoiceItem.find (@invoiceItems[item.id])
          cart.quantity = params['quantity' + i.to_s]
          if @invoice.merchant.discount == 'yes' and !item.discount_start_date.nil? and !item.discount_end_date.nil?
            range = item.discount_start_date.strftime("%Y-%m-%d")..item.discount_end_date.strftime("%Y-%m-%d")
            if range.include?(Time.now.strftime("%Y-%m-%d"))
              discounted_item_cost =  item.unit_cost - item.discount_amount
              cart.cost = discounted_item_cost * cart.quantity
            else
              cart.cost = item.unit_cost * cart.quantity
            end
          else
            cart.cost = item.unit_cost * cart.quantity
          end
          @invoice.invoice_items << cart
        end
      else
        cart = InvoiceItem.new
        cart.invoice = @invoice
        cart.item = item
        cart.quantity = params['quantity' + i.to_s]
        if @invoice.merchant.discount == 'yes' and !item.discount_start_date.nil? and !item.discount_end_date.nil?
          range = item.discount_start_date.strftime("%Y-%m-%d")..item.discount_end_date.strftime("%Y-%m-%d")
          if range.include?(Time.now.strftime("%Y-%m-%d"))
            discounted_item_cost =  item.unit_cost - item.discount_amount
            cart.cost = discounted_item_cost * cart.quantity
          else
            cart.cost = item.unit_cost * x.quantity
          end
        else
          cart.cost = item.unit_cost * cart.quantity
        end
        @invoice.invoice_items << cart
      end
    end

    if @invoice.update(invoice_params)
      redirect_to @invoice
    else
      render 'edit'
    end
  end

  def edit
    @items = Item.all
    @invoiceItems = Hash.new
    @quantities = Hash.new
    @invoice = Invoice.find(params[:id])

    @invoice.invoice_items.each do |ii|
      @invoiceItems[ii.item_id] = ii.id
      @quantities[ii.item_id] = ii.quantity
    end
  end

  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
    redirect_to invoice_index_path
  end

  def delete_item
    @item = InvoiceItem.find(params[:id])
    @item.destroy
    redirect_to action: "edit", id: params[:invoice]
  end

  def display_pdf
    @invoice = Invoice.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        #pdf = InvoicePdf.new(@invoice)
        pdf = InvoicePdf.new(@invoice)
        send_data pdf.render,
        filename: 'invoice.pdf',
        type: 'application/pdf',
        disposition: 'inline'
      end
    end
  end

  def display_small_pdf
    @invoice = Invoice.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = SmallInvoicePdf.new(@invoice)
        send_data pdf.render,
                  filename: 'invoice.pdf',
                  type: 'application/pdf',
                  disposition: 'inline'
      end
    end
  end


  def download
    invoices = Invoice.where("start_date between ? and ? and account_type = ?", params[:start_date], params[:end_date], params[:account_type]).order({ start_date: :asc })
    puts invoices
    invoice_ids = Array.new
    invoices.each do |i|
      invoice_ids << i.id
    end
    if invoice_ids.empty?
      flash[:danger] = "No invoices found dates #{ params[:start_date]} and #{ params[:end_date]}"
      redirect_to invoice_index_path
    else
      #@invoice_items = InvoiceItems.joins(:invoice_items, :merchant)#.where(:id => invoice_ids).group(:id).order("sum(invoice_items.cost) DESC")
      #@invoice_items = Invoice.joins(:invoice_items).where(:id => invoice_ids)
      #@invoice_items = Invoice.includes(:invoice_items, :merchants).where(:id => invoice_ids)#.group(:id, :start_date, 'merchants.merchant_name').order("sum(invoice_items.cost)")
      #@invoice_items = InvoiceItem.where(:invoice_id => invoice_ids).group(:Invoice_id)#.order("sum(invoice_items.cost) DESC")
      @invoice_items = InvoiceDownload.where(:invoice_id => invoice_ids)

      puts 'ddddddddd'
      puts @invoice_items.inspect
      #puts @invoice_summary.inspect
      respond_to do |format|
        format.html
        format.csv {send_data @invoice_items.to_csv, filename: "invoice-#{Date.today}.csv"}
      end
    end
  end


  def email_invoice
    @invoice = Invoice.find(params[:id])


    respond_to do |format|
        InvoiceMailer.welcome_email(@invoice).deliver_later

        format.html { redirect_to(@invoice, notice: 'Invoice was successfully emailed.') }
        format.json { render json: @invoice, status: :created, location: @invoice }

    end

  end

private
  def invoice_params
    params.require(:invoice).permit(:start_date, :merchant_id, :description)

  end

end
