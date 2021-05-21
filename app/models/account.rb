class Account < ApplicationRecord
  ACCOUNT_TYPES = ["Cash", "Retirement", "Brokerage","Liability"]

  has_many :holdings
  has_many :stocks, through: :holdings
  validates :name, presence: true
  validates :account_type, inclusion: {in: ACCOUNT_TYPES}

  def account_balance
    sum = 0
    self.holdings.each do |holding|
     sum += holding.stock_balance
    end
    sum.round(2)
  end

  def self.total_balance
    accounts = Account.all
    sum = 0
    accounts.each do |account|
      sum += account.account_balance
    end
    sum
  end

end
