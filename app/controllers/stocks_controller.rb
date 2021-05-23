class StocksController < ApplicationController
  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(stock_params)
    if @stock.save
      redirect_to accounts_path
    else
      render :new
    end
  end

  def edit
    @stock = Stock.find(params[:id])
  end

  def update
    @stock = Stock.find(params[:id])
    if @stock.update(stock_params)
      redirect_to accounts_path
    else
      render :edit
    end
  end

  private
  def stock_params
    params.require(:stock).permit(:ticker, :stock_price, :asset_type)

  end
end
