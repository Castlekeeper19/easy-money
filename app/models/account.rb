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
    balance.round(2)
    save
    balance
  end

  def self.total_balance
    sum = 0
    Account.all.each do |account|
      sum += account.account_balance
    end
    sum.round(2)
  end

  def stock_purchased(holding)
    self.cash_reserve -= holding.stock_balance
    self.cash_reserve.round(2)
    save
  end

  def stock_sold(holdings)
    self.cash_reserve += holdings.stock_balance
    save
  end
end
