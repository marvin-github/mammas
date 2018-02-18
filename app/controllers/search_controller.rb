class SearchController < ApplicationController
  def index
  end

  def invoice_number
    @invoice = Invoice.where('id = ?', params[:invoice_number])
    puts @invoice.inspect
    if @invoice.size == 0
      flash[:error] = "Invoice not found"
      redirect_to search_index_path
    end

  end

  def invoice_date
    @invoice = Invoice.where('start_date = ?', params[:invoice_date])

    if @invoice.size == 0
      flash[:error] = "No invoices found on #{params[:invoice_date]}"
      redirect_to search_index_path
    end

  end
end
