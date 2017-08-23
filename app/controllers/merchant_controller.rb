class MerchantController < ApplicationController

  before_action :authorize

  def index
    @merchant = Merchant.all

  end

  def show
    @merchant = Merchant.find(params[:id])
  end

  def edit
    @merchant = Merchant.find(params[:id])
  end

  def update
    @merchant = Merchant.find(params[:id])
    if @merchant.update(merchant_params)
      redirect_to merchant_index_path
    else
      render 'edit'
    end
  end

  def new
    @merchant = Merchant.new

  end



  def create

    @merchant = Merchant.new(merchant_params)

    if @merchant.save
      flash[:notice] = "Merchant has been created"
      redirect_to merchant_index_path
    else
      render 'new'
    end
  end

  private
  def merchant_params
    params.require(:merchant).permit(:merchant_name, :address1, :address2, :city, :state, :zip, :email, :phone,
    :discount, :discount_start_date, :discount_end_date, :cash_account)

  end
end
