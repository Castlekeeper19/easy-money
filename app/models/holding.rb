class Holding < ApplicationRecord
  belongs_to :stock
  belongs_to :account

  validates :shares, presence: true

  def stock_balance
    (self.shares * self.stock.stock_price).round(2)
  end
end
