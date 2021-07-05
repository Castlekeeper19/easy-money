class Account < ApplicationRecord
  ACCOUNT_TYPES = ["Cash", "Retirement", "Brokerage","Liability"]

  has_many :holdings, dependent: :destroy
  has_many :goals, dependent: :destroy
  has_many :stocks, through: :holdings
  belongs_to :user
  validates :name, presence: true


  def account_balance
    balance = cash_reserve || 0
    holdings.each do |holding|
     balance += (holding.stock_balance)
    end
    balance
    save
    ('%.2f' % balance).to_f
  end

  def self.total_balance
    sum = 0
    Account.all.each do |account|
      sum += account.account_balance
    end
    '%.2f' % sum.to_f
  end

  def stock_purchased(holding)
    cash_reserve -= holding.stock_balance
    '%.2f' %  cash_reserve
    save
  end

  def stock_sold(holdings)
    self.cash_reserve += holdings.stock_balance
    save
  end
end
