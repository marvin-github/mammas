class MerchantController < ApplicationController

  before_action :authorize

  def index
    @merchant = Merchant.all.order(merchant_name: :asc, store_number: :asc)

  end

  def show
    old_record = Merchant.find(params[:id])
    new_record = old_record.dup

    new_record.save
    redirect_to edit_merchant_path(new_record.id)
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
    params.require(:merchant).permit(:merchant_name, :store_number, :address1, :address2, :city, :state, :zip, :email, :phone,
    :discount, :discount_start_date, :discount_end_date, :account_type)

  end
end
