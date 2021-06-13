class Holding < ApplicationRecord
  belongs_to :stock
  belongs_to :account
  validates :shares, presence: true

  def stock_balance
    (shares * stock.stock_price).round(2)
  end

  def total_gain
    gain = (stock.stock_price) - (purchase_price)
    gain = gain * shares
    gain.round(2)
  end
end
