class InvoiceController < ApplicationController

  before_action :authorize

  def index
    @invoice = Invoice.all

  end

  def new
    @invoice = Invoice.new
    @item = Item.all

  end

  def show
    @invoice = Invoice.find(params[:id])


  end

  def create
    @invoice = Invoice.new(invoice_params)
    if params[:selections].blank?
      flash[:danger] = 'Must select at least one item'
      redirect_to :controller => 'invoice', :action => 'new' and return
    else
      params[:selections].each do |i|
        if params['quantity' + i.to_s].blank? and
          flash[:danger] = 'Must enter quantity if item is selected'
          #redirect_to :controller => 'invoice', :action => 'new' and return
          render 'new'
        end
      end
    end
    @items = Item.find(params[:selections])
    @invoice.user_id = session[:user_id]
    if @invoice.save
      flash[:notice] = "Invoice has been created"
      params[:selections].each do |i|

        item = Item.find(i)
        puts 'llllllllll'
        puts item.inspect

        cart = InvoiceItem.new
        cart.invoice = @invoice
        cart.item = item

        cart.quantity = params['quantity' + i.to_s]
        if @invoice.merchant.discount == 'yes' and !@invoice.merchant.discount_start_date.nil? and !@invoice.merchant.discount_end_date.nil?
          range = @invoice.merchant.discount_start_date.strftime("%Y-%m-%d")..@invoice.merchant.discount_end_date.strftime("%Y-%m-%d")
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
    @invoice = Invoice.all
    respond_to do |format|
      format.html
      format.csv {send_data @invoice.to_csv, filename: "invoice-#{Date.today}.csv"}
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
