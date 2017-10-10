class InvoiceController < ApplicationController

  before_action :authorize

  def index
    @invoice = Invoice.all

  end

  def new
    puts 'aaaaaa'
    @account_type =  params[:account_type]
    puts @account_type
    @invoice = Invoice.new
    @item = Item.all

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
    else
      params[:selections].each do |i|
        #this is a hack it checks the id of the item to determine if it's for cash accounts only
        if account_type == 0
          if i.to_i.between?(22,26)
            flash[:danger] = 'Items that start with a 6 are for cash accounts only'
            redirect_to :controller => 'invoice', :action => 'new' and return

          end
        end
      end
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
            cart.cost = item.unit_cost * cart.quantity - (item.discount_amount)
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
# 'to do: apply discount when updated not sure if it works'
    @invoice = Invoice.find(params[:id])


    @invoiceItems = Hash.new

    @invoice = Invoice.find(params[:id])

    @invoice.invoice_items.each do |ii|
      @invoiceItems[ii.item_id] = ii.id
    end

    @invoice.user_id = session[:user_id]
      flash[:notice] = "Invoice has been updated"
      params[:selections].each do |i|
        item = Item.find(i)
        if @invoiceItems.member?(item.id)
          unless params['quantity' + i.to_s].blank?
            x = InvoiceItem.find (@invoiceItems[item.id])
            x.quantity = params['quantity' + i.to_s]
            x.cost = item.unit_cost * x.quantity
            @invoice.invoice_items << x
          end
        else
          cart = InvoiceItem.new
          cart.invoice = @invoice
          cart.item = item
          cart.quantity = params['quantity' + i.to_s]
          cart.cost = item.unit_cost * cart.quantity
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
    print 'lllllllllllll'
    puts params.inspect
    puts params[:invoice].inspect
    @item = InvoiceItem.find(params[:id])
    @item.destroy
    redirect_to action: "edit", id: params[:invoice]
  end

  def display_pdf
    @invoice = Invoice.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = InvoicePdf.new(@invoice)
        send_data pdf.render,
        filename: 'invoice.pdf',
        type: 'application/pdf',
        disposition: 'inline'
      end
    end
  end



  def download
    invoices = Invoice.where("start_date between ? and ? and account_type = ?", params[:start_date], params[:end_date], params[:account_type])
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
