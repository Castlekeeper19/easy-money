class Account < ApplicationRecord
  ACCOUNT_TYPES = ["Cash", "Retirement", "Brokerage","Liability"]

  has_many :holdings
  has_many :stocks, through: :holdings
  validates :name, presence: true
  validates :account_type, inclusion: {in: ACCOUNT_TYPES}

  def account_balance
    @balance = 0
    self.holdings.each do |holding|
     @balance += holding.stock_balance
    end
    self.balance = @balance.round(2)
    self.save
    self.balance
  end

  def self.total_balance
   # accounts = Account.all
    sum = 0
   Account.all.each do |account|
      sum += account.balance
    end
    sum
  end

end
