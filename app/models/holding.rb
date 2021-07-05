class Holding < ApplicationRecord
  belongs_to :stock
  belongs_to :account
  validates :shares, presence: true

  def stock_balance
   ('%.2f' %  (shares * stock.stock_price)).to_f
  end

  def total_gain
    gain = (stock.stock_price) - (purchase_price)
    gain = gain * shares
    ('%.2f' % gain).to_f
  end
end
