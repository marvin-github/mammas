class InvoiceController < ApplicationController

  before_action :authorize

  def index
    @invoice = Invoice.all

  end

  def new
    @invoice = Invoice.new

  end

  def show
    @invoice = Invoice.find(params[:id])

  end

  def create

    @invoice = Invoice.new(invoice_params)

    @invoice.user_id = session[:user_id]
    puts @invoice.inspect
    if @invoice.save
      flash[:notice] = "Invoice has been created"
      redirect_to @invoice
    else
      render 'new'
    end
  end

  def update
    @invoice = Invoice.find(params[:id])
    if @invoice.update(invoice_params)
      redirect_to @invoice
    else
      render 'edit'
    end
  end

  def edit
    @invoice = Invoice.find(params[:id])
  end

  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
    redirect_to invoice_index_path
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


private
  def invoice_params
    params.require(:invoice).permit(:start_date, :merchant_id, :price, :quantity, :description, :upc, :extra_cases, :extended_cost)

  end

end
