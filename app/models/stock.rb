class Stock < ApplicationRecord
  ASSET_TYPES = [ "Stock", "Bond","Alternative", "Cash", "EQUITY"]
  has_many :holdings, dependent: :destroy

  validates :ticker, uniqueness: true, presence: true
  # validates :asset_type, inclusion: {in: ASSET_TYPES}
  validates :stock_price, presence: true
end
