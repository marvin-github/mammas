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
    start_date = Time.parse(params[:invoice_date])
    end_date = Time.parse(params[:invoice_date]) + 1.day
    @user = User.find(session[:user_id])

    if @user.name == 'cr_admin'
      @invoice = Invoice.where('start_date between ? and ? and account_type = ?', start_date, end_date, 9)
    else
      @invoice = Invoice.where('start_date between ? and ?', start_date, end_date)
    end

    if @invoice.size == 0
      flash[:error] = "No invoices found on #{params[:invoice_date]}"
      redirect_to search_index_path
    end

  end
end
