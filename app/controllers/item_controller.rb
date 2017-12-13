class ItemController < ApplicationController

  before_action :authorize

  def index
    @item = Item.all

  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_index_path
    else
      render 'edit'
    end
  end

  def new
    @item = Item.new

  end



  def create

    @item = Item.new(item_params)

    if @item.save
      flash[:notice] = "Item has been created"
      redirect_to item_index_path
    else
      render 'new'
    end
  end

  private
  def item_params
    params.require(:item).permit(:description,
    :upc,
    :package_counts,
    :unit_cost,
    :case_cost,
    :retail_cost,
    :discount_amount,
    :discount_start_date,
    :mimick_item,
    :mexicana_item,
    :mamas_item,
    :discount_end_date)

  end
end
