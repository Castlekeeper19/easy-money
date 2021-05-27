class HoldingsController < ApplicationController
  # before_action :set_holding, only: [:destroy]

  def new
    @account = Account.find(params[:account_id])
    @stocks = Stock.all
    @holding = Holding.new
    @stock = Stock.new
  end

  def create
    @holding = Holding.new(holding_params)
    @holding.purchase_price = @holding.stock.stock_price
    @holding.account = Account.find(params[:account_id])
    if @holding.save
      redirect_to account_path(@holding.account)
    else
      render :new
    end
  end

  def edit
    # @holding.account = Account.find(params[:account_id])
    @account = Account.find(params[:id])
    @holding = Holding.find(params[:account_id])
  end

  def update
    @holding = Holding.find(params[:id])
    if @holding.update(holding_params)
      redirect_to account_path(@holding.account)
    else
      render :edit
    end
  end

  def destroy
    @holding = Holding.find(params[:id])
    @holding.destroy
    redirect_to account_path(@holding.account)
  end

  private
  def holding_params
    params.require(:holding).permit(:shares, :stock_id)
  end

  def set_holding
    @holding = Holding.find(params[:id])
  end
end
