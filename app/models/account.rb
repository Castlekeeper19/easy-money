class Account < ApplicationRecord
  ACCOUNT_TYPES = ["Cash", "Retirement", "Brokerage","Liability"]

  has_many :holdings
  has_many :goals
  has_many :stocks, through: :holdings
  belongs_to :user
  validates :name, presence: true

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
    sum = 0
    Account.all.each do |account|
      sum += account.balance
    end
    sum.round(2)
  end

end
