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

private
  def invoice_params
    params.require(:invoice).permit(:start_date, :merchant, :credit, :debit, :quantity)
  end

end
