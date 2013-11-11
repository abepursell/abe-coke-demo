class PurchasesController < ApplicationController

  def new
    @purchase = Purchase.new
    render :new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.save
      redirect_to @purchase
    else
      render :new
    end
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  private

  def purchase_params
    params.require(:purchase).permit(:sender_name, :cell_number, :recipient_name, :drink_type)
  end

end
