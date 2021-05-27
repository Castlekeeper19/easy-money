class Holding < ApplicationRecord
  belongs_to :stock
  belongs_to :account
  validates :shares, presence: true

  def stock_balance
    (self.shares * self.stock.stock_price).round(2)
  end

  def total_gain
    gain = (self.stock.stock_price) - (self.purchase_price)
    self.gain = gain * self.shares
    self.gain.round(2)
  end
end
