class BulkDiscountsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
    @discounts = @merchant.bulk_discounts.all
    @holidays = NagerService.holidays
  end

  def show
    @merchant = Merchant.find(params[:merchant_id])
    @discount = BulkDiscount.find(params[:id])
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
    @discount = BulkDiscount.new
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    discount = merchant.bulk_discounts.create(discount_params)
    redirect_to merchant_bulk_discounts_path(merchant)
  end

  def edit
    @merchant = Merchant.find(params[:merchant_id])
    @discount = BulkDiscount.find(params[:id])
  end

  def update
    @merchant = Merchant.find(params[:merchant_id])
    @discount = BulkDiscount.find(params[:id])
    update = @discount.update(discount_params)

    redirect_to merchant_bulk_discount_path(@merchant, @discount)
  end

  def destroy
  
    merchant = Merchant.find(params[:merchant_id])
    bulk_discount = BulkDiscount.find(params[:id])
    bulk_discount.destroy

    redirect_to merchant_bulk_discounts_path(merchant)

  end

  private
  def discount_params
    params.require(:bulk_discount).permit(:percentage_discount, :quantity)
  end
end
