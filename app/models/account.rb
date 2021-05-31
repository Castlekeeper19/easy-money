class Account < ApplicationRecord
  ACCOUNT_TYPES = ["Cash", "Retirement", "Brokerage","Liability"]

  has_many :holdings, dependent: :destroy
  has_many :goals, dependent: :destroy
  has_many :stocks, through: :holdings
  validates :name, presence: true
  validates :account_type, inclusion: {in: ACCOUNT_TYPES}


  def account_balance
    @balance = 0
    self.holdings.each do |holding|
     @balance += holding.stock_balance
    end
    self.balance = @balance.round(2) + self.cash_reserve.round(2)
    self.save
    self.balance
  end

  def self.total_balance
    sum = 0
    Account.all.each do |account|
      sum += account.balance
    end
    sum.round(2)
  end

  def stock_sold(holding)
    self.cash_reserve += holding.stock_balance
    self.save
  end
end
