class Goal < ApplicationRecord
  belongs_to :account
  validates :name, presence: true
  validates :goal_amount, presence: true
  has_one_attached :photo
  # validates :end_date, on_or_after: lambda { Date.current }

end
